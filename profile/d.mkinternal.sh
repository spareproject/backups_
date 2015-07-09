#!/bin/env bash
###############################################################################################################################################################################################################
umask 077
if [[ ${1} ]];then
###############################################################################################################################################################################################################
PROFILE=${1}
PROFILE_="/mnt/profile/${PROFILE}"
###############################################################################################################################################################################################################
if [[ -d ${PROFILE_}/internal ]];then
  while [[ ${QUERY} != @("y"|"n") ]];do
    read -r -p "internal exists in profile:${PROFILE} delete? (y|n) " QUERY
    if [[ ${QUERY} == "y" ]];then
      rm -r ${PROFILE_}/internal
    elif [[ ${QUERY} == "n" ]];then
      echo "internal in profile:${PROFILE} already exists quiting..."
      exit
    fi
  done
fi
###############################################################################################################################################################################################################
mkdir -p ${PROFILE_}/internal/{gnupg,ssh,sshd,luks,rawfs,mount}
cp /etc/gnupg/gpg* ${PROFILE_}/internal/gnupg/

OLD=$(stat -c %U $(tty))
chown root:tty $(tty)

gpg --homedir ${PROFILE_}/internal/gnupg --batch --gen-key /etc/gnupg/batch.internal
gpg --homedir ${PROFILE_}/internal/gnupg --output ${PROFILE_}/internal/public.key --export internal
ssh-keygen -t rsa -b 4096 -f "${PROFILE_}/internal/ssh/id_rsa" -N ""
ssh-keygen -t rsa -b 4096 -f "${PROFILE_}/internal/sshd/ssh_host_rsa_key" -N ""
###############################################################################################################################################################################################################
unset QUERY
while [[ ${QUERY} != @("y"|"n") ]];do
  read -r -p "encrypt internal keys? (do this or gtfo)  (y|n)" QUERY
  if [[ ${QUERY} == "y" ]];then
    gpg --homedir ${PROFILE_}/internal/gnupg --output ${PROFILE_}/internal/public.gpg                 -e ${PROFILE_}/internal/public.key
    gpg --homedir ${PROFILE_}/internal/gnupg --output ${PROFILE_}/internal/ssh/id_rsa.gpg             -e ${PROFILE_}/internal/ssh/id_rsa
    gpg --homedir ${PROFILE_}/internal/gnupg --output ${PROFILE_}/internal/sshd/ssh_host_rsa_key.gpg  -e ${PROFILE_}/internal/sshd/ssh_host_rsa_key
  fi
done

chown ${OLD}:tty $(tty)

###############################################################################################################################################################################################################  
else
cat << EOF
takes profile name
EOF
fi
###############################################################################################################################################################################################################  
