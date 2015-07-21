#!/bin/env bash
###############################################################################################################################################################################################################
mkdir -p ./rootfs/{boot,root}
mount ${1} ./mount
cp ./install.sh ./rootfs/root/
###############################################################################################################################################################################################################
#mkdir -p ./rootfs/usr/lib/initcpio/
#mkdir -p ./rootfs/etc
#cp ./init ./rootfs/usr/lib/initcpio/
#cp ./mkinitcpio.conf ./rootfs/etc/
#chattr +i ./rootfs/usr/lib/initcpio/init
#chattr +i ./rootfs/etc/mkinitcpio.conf
###############################################################################################################################################################################################################
pacstrap -d ./rootfs base syslinux gptfdisk
cp ./init ./rootfs/usr/lib/initcpio/
cp ./mkinitcpio.conf ./rootfs/etc/
arch-chroot ./rootfs /root/install.sh ${1}
###############################################################################################################################################################################################################
sed "s/CHANGEMEH/$(blkid ${1} -s PARTUUID -o value)/" syslinux.cfg > ./rootfs/boot/syslinux/syslinux.cfg
sync
bootctl --path ./mount install
sed "s/CHANGEMEH/$(blkid ${1} -s PARTUUID -o value)/" arch.conf    > ./mount/loader/entries/arch.conf
cp -ar ./rootfs/boot/* ./mount/
sync
rm -r ./rootfs/boot
mksquashfs rootfs ./mount/rootfs.squashfs
sync
#umount ./mount
sync
echo " quick and dirty... "
