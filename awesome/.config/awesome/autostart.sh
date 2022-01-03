#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom
# run xautolock -time 10 -locker blurlock
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#xfce4-power-manager &
#ff-theme-util &
#fix_xcursor &
run nm-applet
run pamac-tray
run xfce4-clipman
run volumeicon
