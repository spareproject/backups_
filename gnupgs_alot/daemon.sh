#!/bin/env bash
#if [[ ! -d /tmp/gnupg ]];then mkdir -p /tmp/gnupg;fi
if [[ ! -d /tmp/mount ]];then mkdir -p /tmp/mount;fi
while true;do
  if [[ ! $(mount | grep /tmp/gnupg) ]];then
    if [[ -f /tmp/hotplug ]];then 
      if [[ -b /dev/$(head -c 3 /tmp/hotplug | tr -cd 'a-z') ]];then
        if [[ $(mount | grep /tmp/mount) ]];then
          umount /tmp/mount
        fi  
        mount /dev/$(head -c 3 /tmp/hotplug | tr -cd 'a-z') /tmp/mount
        if [[ -d /tmp/mount/gnupg ]];then 
          cp -ar /tmp/mount/gnupg/ /tmp/
          rm /tmp/hotplug
          sync
          touch /tmp/unlocked
          gpg --homedir /tmp/gnupg --passphrase-fd 0 -d /tmp/mount/test.asc < /tmp/mount/passphrase_random
          umount /tmp/mount
          sync
          (sleep 60 && rm -r /tmp/{gnupg,unlocked} &)&
        fi
      fi
    fi
  fi
sleep 1
done
