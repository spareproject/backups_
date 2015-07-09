#!/bin/env bash
###############################################################################################################################################################################################################
umask 077
if [[ ${1} ]];then
###############################################################################################################################################################################################################
PROFILE=${1}
PROFILE_="/mnt/profile/${PROFILE}"
###############################################################################################################################################################################################################
if [[ -d ${PROFILE_}/host/user ]];then
  while [[ ${QUERY} != @("y"|"n") ]];do
    read -r -p "user exists in profile:${PROFILE} delete? (y|n) " QUERY
    if [[ ${QUERY} == "y" ]];then
      rm -r ${PROFILE_}/host/user
    elif [[ ${QUERY} == "n" ]];then
      echo "user in profile:${PROFILE} already exists quiting..."
      exit
    fi
  done
fi
###############################################################################################################################################################################################################
mkdir -p ${PROFILE_}/host/user/{gnupg,ssh,sshd}
cp /etc/gnupg/gpg* ${PROFILE_}/host/user/gnupg/

OLD=$(stat -c %U $(tty));chown root:tty $(tty) 

gpg --homedir ${PROFILE_}/host/user/gnupg --batch --gen-key /etc/gnupg/batch.user
gpg --homedir ${PROFILE_}/host/user/gnupg --armor --output ${PROFILE_}/host/user/public.key --export user
ssh-keygen -t rsa -b 4096 -f "${PROFILE_}/host/user/ssh/id_rsa" -N ""
ssh-keygen -t rsa -b 4096 -f "${PROFILE_}/host/user/sshd/ssh_host_rsa_key" -N ""
###############################################################################################################################################################################################################
if [[ -d ${PROFILE_}/host/root/gnupg ]];then
unset QUERY;while [[ ${QUERY} != @("y"|"n") ]];do
  read -r -p "root exists... sign user? (requires root password) (y|n)" QUERY
  if [[ ${QUERY} == "y" ]];then
    gpg --homedir ${PROFILE_}/host/root/gnupg --output ${PROFILE_}/host/user/public.sig                 --detach-sig ${PROFILE_}/host/user/public.key
    gpg --homedir ${PROFILE_}/host/root/gnupg --output ${PROFILE_}/host/user/ssh/id_rsa.sig             --detach-sig ${PROFILE_}/host/user/ssh/id_rsa.pub
  fi
done
fi
###############################################################################################################################################################################################################
unset QUERY;while [[ ${QUERY} != @("y"|"n") ]];do
  read -r -p "encrypt user keys? (y|n)" QUERY
  if [[ ${QUERY} == "y" ]];then
    gpg --homedir ${PROFILE_}/host/user/gnupg --output ${PROFILE_}/host/user/ssh/id_rsa.gpg             -e ${PROFILE_}/host/user/ssh/id_rsa
    gpg --homedir ${PROFILE_}/host/user/gnupg --output ${PROFILE_}/host/user/sshd/ssh_host_rsa_key.gpg  -e ${PROFILE_}/host/user/sshd/ssh_host_rsa_key
    rm ${PROFILE_}/host/user/ssh/id_rsa
    rm ${PROFILE_}/host/user/sshd/ssh_host_rsa_key
  fi
done
    
chown ${OLD}:tty $(tty)

###############################################################################################################################################################################################################  
else
cat << EOF
takes profile name... 
EOF
fi
###############################################################################################################################################################################################################  
