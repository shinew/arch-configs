#!/usr/bin/bash

KEYBOARD_CONTROLLER="tpacpi::kbd_backlight"
BRIGHTNESS=$(xbacklight -ctrl "$KEYBOARD_CONTROLLER" -get)
NEW_BRIGHTNESS=$((50 - $BRIGHTNESS))
xbacklight -ctrl "$KEYBOARD_CONTROLLER" -set "$NEW_BRIGHTNESS"
