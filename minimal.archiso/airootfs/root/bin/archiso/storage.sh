#!/bin/env bash
#########################################################################################################################################################################################
HASH=sha512
CIPHER=twofish-xts-plain64
function raw_create {
  echo "createing raw image"
  dd if=/dev/random bs=1 count=8192 | gpg --homedir ${GNUPG_} -e -r "container" >${KEY_}${1}
  fallocate -l ${SIZE} ${RAWFS_}${1}
  gpg --homedir ${GNUPG_} -d ${KEY_}${1} 2>/dev/null | cryptsetup --hash=${HASH} --cipher=${CIPHER} --offset=0 --key-file=- open --type=plain ${RAWFS_}${1} ${1}
  mkfs.ext4 /dev/mapper/${1}
  mkdir ${2}
  mount /dev/mapper/${1} ${2}
echo "creating rawfs... size: ${SIZE}"
echo "keyfs_ ${KEYS_}/${1} rawfs_ ${RAWFS}_}/${1} map_ /dev/mapper/${1} mount_ ${MOUNT_}/${1}"
}
function raw_mount {
  if [[ ! -d ${2} ]];then mkdir ${2};fi
  gpg --homedir ${GNUPG_} -d ${KEY_}${1} 2>/dev/null | cryptsetup --hash=${HASH} --cipher=${CIPHER} --offset=0 --key-file=- open --type=plain ${RAWFS_}${1} ${1}
  mount /dev/mapper/${1} ${2}
echo "rawfs_ /${RAWFS_}/${1} key_ /${KEY_}/${1} map_ /dev/mapper/${1} mount_ ${MOUNT_}${2}"
}
###############################################################################################################################################################################################################

# /mnt/profile/<name>
#               uid
#               gid
#               
#RAW            /.raw
#LUKS           /luks

function create_key {
  dd if=/dev/random bs=1 count=8192 | gpg --homedir ${} -e > ${}
}
function create_image {
  fallocate -l ${SIZE} ${}
}
function map_image {
  gpg --homedir ${} -d ${} 2>/dev/null | cryptsetup --hash=${HASH} --cipher=${CIPHER} --offset=0 --key-file=- open --type=plain ${}
}
function map_format {
  mkfs.ext4 ${}
}
function map_resize {

}
function mount_map {
  mount ${} ${}
}


