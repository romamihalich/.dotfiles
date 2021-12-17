#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom
run nitrogen --restore
run volumeicon
run nm-applet
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#xfce4-power-manager &
run pamac-tray
run xfce4-clipman
run start_conky_maia
run xautolock -time 10 -locker blurlock
#ff-theme-util &
#fix_xcursor &
run udiskie
run sxhkd
