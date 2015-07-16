###############################################################################################################################################################################################################
[[ $- != *i* ]] && return
echo 360 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_established
###############################################################################################################################################################################################################

# wtf
brctl addbr lulz
brctl delbr lulz
systemctl start systemd-networkd
systemctl start dhcpd4
systemctl start dnscrypt-proxy
mkdir /tmp/mount;chmod -R 700 /tmp/mount;chown -R user:lulz /tmp/mount
mv /root/09-gnupg.rules /etc/udev/rules.d/

###############################################################################################################################################################################################################
umask 077
OLD=$(stat -c %U $(tty))
chown root:tty $(tty)
###############################################################################################################################################################################################################
read -p "enter user key password... (press any key to continue)"
gpg --homedir /home/user/gnupg/ --batch --gen-key /etc/gnupg/batch.user
gpg --homedir /home/user/gnupg/ --output /home/user/user.public --export user
ssh-keygen -t rsa -b 4096 -f "/home/user/ssh/id_rsa" -N ""
ssh-keygen -t rsa -b 4096 -f "/home/user/sshd/ssh_host_rsa_key" -N ""
gpg --homedir /home/user/gnupg -e /home/user/ssh/id_rsa;rm /home/user/ssh/id_rsa
gpg --homedir /home/user/gnupg -e /home/user/sshd/ssh_host_rsa_key;rm /home/user/sshd/ssh_host_rsa_key
gpg --homedir /home/user/gnupg --import /home/user/root.public
gpg --homedir /home/user/gnupg --lsign-key root
###############################################################################################################################################################################################################
read -p "enter root key password... (press any key to continue)"
gpg --homedir /root/gnupg --output /home/user/user.sig                  --sign /home/user/user.public
gpg --homedir /root/gnupg --output /home/user/ssh/id_rsa.sig            --sign /home/user/ssh/id_rsa.pub
gpg --homedir /root/gnupg --output /home/user/sshd/ssh_host_rsa_key.sig --sign /home/user/sshd/ssh_host_rsa_key.pub
rm -r /root/gnupg
pkill gpg-agent
###############################################################################################################################################################################################################
chown -R user:lulz /home/user
chmod -R 700 /home/user
chown ${OLD}:tty $(tty)
###############################################################################################################################################################################################################
echo "" > /root/.bash_profile
###############################################################################################################################################################################################################
