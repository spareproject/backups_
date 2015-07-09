#!/bin/env bash
###############################################################################################################################################################################################################
umask 077
if [[ ${3} ]];then
###############################################################################################################################################################################################################
PROFILE="${1}"
PROFILE_="/mnt/profile/${PROFILE}"
RAWFS="${2}"
SIZE="${3}"
###############################################################################################################################################################################################################
dd if=/dev/random bs=1 count=8192 | gpg --homedir ${PROFILE_}/internal/gnupg -e > ${PROFILE_}/internal/luks/${RAWFS}.gpg
fallocate -l ${SIZE} ${PROFILE_}/internal/rawfs/${IMAGE}.rawfs
gpg --homedir ${PROFILE_}/internal/gnupg -d ${PROFILE_}/internal/luks/${RAWFS}.gpg 2>/dev/null |
cryptsetup --hash=sha512 --cipher=twofish-xts-plain64 --offset=0 --key-file=- open --type=plain ${PROFILE_}/internal/rawfs/${RAWFS}
mkfs.ext4 /dev/mapper/${RAWFS}
if [[ ! -d ${PROFILE_}/internal/mount/${RAWFS} ]];then mkdir ${PROFILE_}/internal/mount/${RAWFS};fi
mount /dev/mapper/${RAWFS} ${PROFILE_}/internal/mount/${RAWFS}
###############################################################################################################################################################################################################
else
cat << EOF
takes...
\$1 - profile
\$2 - rawfs name
\$3 - size
EOF
