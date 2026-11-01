#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# prevents cursor from opening hyprland in its own shell
if [ -z "${VSCODE_RESOLVING_ENVIRONMENT:-}" ] \
   && [ -z "${WAYLAND_DISPLAY:-}" ] \
   && [ -z "${DISPLAY:-}" ] \
   && [ "${XDG_VTNR:-}" = 1 ]; then
  #exec start-hyprland
fi

# Created by `pipx` on 2026-11-01 15:58:21
export PATH="$PATH:/home/skistaddy/.local/bin"
