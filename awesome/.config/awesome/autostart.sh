#!/usr/bin/env bash

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run nm-applet
run udiskie --tray
run picom
run ~/.fehbg
run conky
run volumeicon
run hiddify
