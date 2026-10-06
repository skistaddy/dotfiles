# dotfiles
important files and information related to my arch linux setup

# packages
package list in `packages.txt` was generated with
```
yay -Qqem > packages.txt
pacman Qqen > packages.txt
```
# audio
pipewire sets these files to sample rate to 64 which is a low so they should both be increased to 2048.
```
/sys/class/rtc/rtc0/max_user_freq
/proc/sys/dev/hpet/max-user-freq
```
