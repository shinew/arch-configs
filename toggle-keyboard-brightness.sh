#!/usr/bin/bash

KEYBOARD_CONTROLLER="tpacpi::kbd_backlight"
BRIGHTNESS=$(xbacklight -ctrl "$KEYBOARD_CONTROLLER" -get)

case "$BRIGHTNESS" in
0)
  NEW_BRIGHTNESS=50
  ;;
50)
  NEW_BRIGHTNESS=0
  ;;
esac

xbacklight -ctrl "$KEYBOARD_CONTROLLER" -set "$NEW_BRIGHTNESS"
