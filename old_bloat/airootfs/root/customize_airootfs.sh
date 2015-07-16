#!/bin/bash
###############################################################################################################################################################################################################
#MISC
###############################################################################################################################################################################################################
set -e -u
loadkeys uk;
setfont Lat2-Terminus16;
locale-gen;
ln -sf /usr/share/zoneinfo/UTC /etc/localtime
if [[ -f /usr/bin/pinentry ]];then rm /usr/bin/pinentry;ln -s /usr/bin/pinentry-curses /usr/bin/pinentry;else ln -s /usr/bin/pinentry-curses /usr/bin/pinentry;fi
###############################################################################################################################################################################################################
chmod 700 /root
chmod -R 700 /etc/iptables
chmod -R 700 /boot
chmod -R 700 /etc/sudoers*
passwd -l root
###############################################################################################################################################################################################################
#USERS
###############################################################################################################################################################################################################

# create root signing key...
OLD=$(stat -c %U $(tty))
chown root:tty $(tty)
read -p "enter root signing key password... (press any key to continue)"
gpg --homedir /root/gnupg --batch --gen-key /etc/gnupg/batch.root
gpg --homedir /root/gnupg --output /home/user/root.public --export root

USER=$(shuf -i 60000-65536 -n 1);LULZ=${USER}
while [[ ${LULZ} == ${USER} ]];do LULZ=$(shuf -i 60000-65536 -n 1);done
groupadd --gid ${LULZ} lulz
useradd --uid ${USER} -g lulz -s /bin/bash user;
chown -R user:lulz /home/user;
chmod -R 700 /home/user
passwd -l user

###############################################################################################################################################################################################################
#PACKAGES / PACMAN
###############################################################################################################################################################################################################
# anything that didnt survive current boot without pacman -Rns blocking on deps that i dont use
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
#pacman -Rns diffutils
pacman -Rns gettext
#pacman -Rns dhcpcd 
pacman -Rns jfsutils
pacman -Rns licenses
pacman -Rns iputils
#pacman -Rns sysfsutils
pacman -Rns nano
pacman -Rns pcmciautils
#pacman -Rns netctl 
pacman -Rns reiserfsprogs
pacman -Rns s-nail
pacman -Rns vi
pacman -Rns xfsprogs
pacman -Rns which
pacman -Rns logrotate
pacman -Rns lvm2
pacman -Rns file
pacman -Rns systemd-sysvcompat
#pacman -Rnsdd lynx 
###############################################################################################################################################################################################################
#BOOT - SERVICES
###############################################################################################################################################################################################################
rm /etc/systemd/system/multi-user.target.wants/remote-fs.target
systemctl enable iptables.service
systemctl enable ip6tables.service
systemctl enable haveged.service
systemctl enable systemd-networkd.service
systemctl enable dhcpd4.service
systemctl enable dnscrypt-proxy.service
systemctl enable pacman-init.service
systemctl enable combine.service
###############################################################################################################################################################################################################
#NON-REPO PACKAGES
###############################################################################################################################################################################################################
pacman -U /root/dwm-6.0-2-x86_64.pkg.tar.xz
pacman -U /root/chromium-pepper-flash-1:18.0.0.204-1-x86_64.pkg.tar.xz
###############################################################################################################################################################################################################
