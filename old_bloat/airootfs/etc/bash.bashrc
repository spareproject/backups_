# /etc/bash.bashrc
##########################################################################################################################################################################################
[[ $- != *i* ]] && return
if [[ $(id -u) != 0 ]];then
  PS1="\[\e[32m\][\u@archiso]\[\e[36m\][\w]:\[\e[m\] "
else
    PS1="\[\e[32m\][\u@archiso]\[\e[31m\][\w]:\[\e[m\] "
fi
PS2='> '
PS3='> '
PS4='+ '
##########################################################################################################################################################################################
#case ${TERM} in
#  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
#    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
#    ;;
#  screen)
#    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
#    ;;
#esac
#[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
##########################################################################################################################################################################################
alias ls='ls --color=auto'
alias l='ls -lh'
alias ll='ls -alh'
alias c='clear; cat /etc/banner'
alias cl='clear;cat /etc/banner;ls -lAh'
alias cll='clear;cat /etc/banner;ls -alh'
alias ..='cd ..'
export EDITOR=vim
###############################################################################################################################################################################################################
export CAPS="CAP_CHOWN,CAP_DAC_OVERRIDE,CAP_DAC_READ_SEARCH,CAP_FOWNER,CAP_FSETID,CAP_IPC_OWNER,CAP_KILL,CAP_LEASE,CAP_LINUX_IMMUTABLE,CAP_NET_BIND_SERVICE,CAP_NET_BROADCAST,CAP_NET_RAW,CAP_SETGID,CAP_SETFCAP,CAP_SETPCAP,CAP_SETUID,CAP_SYS_ADMIN,CAP_SYS_CHROOT,CAP_SYS_NICE,CAP_SYS_PTRACE,CAP_SYS_TTY_CONFIG,CAP_SYS_RESOURCE,CAP_SYS_BOOT,CAP_AUDIT_WRITE,CAP_AUDIT_CONTROL,CAP_NET_ADMIN"
###############################################################################################################################################################################################################

###
# gnupg path, user.key, user.sig, sshd
export HOST=/root/gnupg
export GNUPG
export SSH
export SSHD

###############################################################################################################################################################################################################
function passwdgen { cat /dev/random | tr -cd 'a-zA-Z0-9' | fold -w 64 | head -n 1; }
###############################################################################################################################################################################################################

