#!/bin/env bash
#bootctl --path /boot install 2>>/root/debug
sgdisk $(sed 's/.$//' <<< ${1}) --attributes=1:set:2 2>>/root/debug
dd bs=440 conv=notrunc count=1 if=/usr/lib/syslinux/bios/gptmbr.bin of=$(sed 's/.$//' <<< ${1}) 2>>/root/debug
syslinux-install_update -i 2>>/root/debug
mkinitcpio -p linux 2>>/root/debug
