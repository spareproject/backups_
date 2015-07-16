#!/bin/env bash
###############################################################################################################################################################################################################
#if [[ ${1} && ${2} ]];then
#CAPS="CAP_CHOWN,CAP_DAC_OVERRIDE,CAP_DAC_READ_SEARCH,CAP_FOWNER,CAP_FSETID,CAP_IPC_OWNER,CAP_KILL,CAP_LEASE,CAP_LINUX_IMMUTABLE,CAP_NET_BIND_SERVICE,CAP_NET_BROADCAST,CAP_NET_RAW,CAP_SETGID,CAP_SETFCAP,CAP_SETPCAP,CAP_SETUID,CAP_SYS_ADMIN,CAP_SYS_CHROOT,CAP_SYS_NICE,CAP_SYS_PTRACE,CAP_SYS_TTY_CONFIG,CAP_SYS_RESOURCE,CAP_SYS_BOOT,CAP_AUDIT_WRITE,CAP_AUDIT_CONTROL,CAP_NET_ADMIN"
#cd ${1}
#(/usr/bin/systemd-nspawn --quiet --boot --network-bridge=${2} --directory=${1} --drop-capability=${CAPS} &>/dev/null &)&
#else
#echo "
#1 --directory \${1}
#2 --network-bridge \${2}
#"
#fi
###############################################################################################################################################################################################################
(/usr/bin/systemd-nspawn --quiet --boot --network-bridge=${2} --directory=${1} --drop-capability="CAP_CHOWN,CAP_DAC_OVERRIDE,CAP_DAC_READ_SEARCH,CAP_FOWNER,CAP_FSETID,CAP_IPC_OWNER,CAP_KILL,CAP_LEASE,CAP_LINUX_IMMUTABLE,CAP_NET_BIND_SERVICE,CAP_NET_BROADCAST,CAP_NET_RAW,CAP_SETGID,CAP_SETFCAP,CAP_SETPCAP,CAP_SETUID,CAP_SYS_ADMIN,CAP_SYS_CHROOT,CAP_SYS_NICE,CAP_SYS_PTRACE,CAP_SYS_TTY_CONFIG,CAP_SYS_RESOURCE,CAP_SYS_BOOT,CAP_AUDIT_WRITE,CAP_AUDIT_CONTROL,CAP_NET_ADMIN" &)&
###############################################################################################################################################################################################################


