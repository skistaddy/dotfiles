#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \w]\$ '
export EDITOR="nvim"
export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"
alias windows="sudo efibootmgr --bootnext 0006 && reboot"

# Makes terminal not throw errors over SSH
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"

# Pi
export PATH="/home/skistaddy/.pi/agent/bin:$PATH"

# Created by `pipx` on 2026-11-01 15:58:21
export PATH="$PATH:/home/skistaddy/.local/bin"
