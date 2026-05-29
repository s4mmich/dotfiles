#!/usr/bin/env bash

CURRENT=$(powerprofilesctl get)

SELECTED=$(yad --title="Power Profiles" \
    --list --radiolist \
    --column="" --column="Mode" \
    $( [ "$CURRENT" = "performance" ] && echo TRUE || echo FALSE ) "performance" \
    $( [ "$CURRENT" = "balanced" ] && echo TRUE || echo FALSE ) "balanced" \
    $( [ "$CURRENT" = "power-saver" ] && echo TRUE || echo FALSE ) "power-saver" \
    --center \
    --skip-taskbar \
    --button="gtk-close:1" \
    --hide-header \
    --height=160 \
    --width=200 \
)

if [ -n "$SELECTED" ] && [ "$SELECTED" != "$CURRENT" ]; then
    powerprofilesctl set "$SELECTED"
fi
