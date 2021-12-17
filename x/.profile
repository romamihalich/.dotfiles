#!/bin/sh

export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/qutebrowser
export TERMINAL=/usr/bin/alacritty
export VISUAL=nvim
export EDITOR="$VISUAL"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# set typematic delay and rate
xset r rate 300 50 &
picom &
nitrogen --restore &
volumeicon &
nm-applet &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#xfce4-power-manager &
pamac-tray &
xfce4-clipman &
start_conky_maia &
xautolock -time 10 -locker blurlock &
#ff-theme-util &
#fix_xcursor &
udiskie &
sxhkd &
