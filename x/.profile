#!/bin/sh

export PATH=$PATH:~/.local/bin
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

sxhkd &
udiskie &
nitrogen --restore &
start_conky_maia &
