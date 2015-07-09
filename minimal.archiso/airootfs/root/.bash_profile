###############################################################################################################################################################################################################
[[ $- != *i* ]] && return
echo 360 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_established
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
###############################################################################################################################################################################################################
read -p "enter root key password... (press any key to continue)"
gpg --homedir /root/gnupg --output /home/user/user.sig                --detach-sig /home/user/user.public
gpg --homedir /root/gnupg --output /home/user/ssh/id_rsa.sig            --detach-sig /home/user/ssh/id_rsa.pub
gpg --homedir /root/gnupg --output /home/user/sshd/ssh_host_rsa_key.sig --detach-sig /home/user/sshd/ssh_host_rsa_key.pub
gpg --homedir /home/user/gnupg --import /home/user/root.public
###############################################################################################################################################################################################################
chown -R user:lulz /home/user
chmod -R 700 /home/user
chown ${OLD}:tty $(tty)
###############################################################################################################################################################################################################
echo "" > /root/.bash_profile
###############################################################################################################################################################################################################
