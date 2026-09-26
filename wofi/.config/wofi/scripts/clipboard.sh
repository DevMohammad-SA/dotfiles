#!/usr/bin/env bash
# Clipboard history picker (cliphist + wofi). Sway stores history via
# `wl-paste --watch cliphist store`. `clipboard.sh delete` removes an entry instead.

if ! command -v cliphist >/dev/null; then
    notify-send -u low "Clipboard" "cliphist is not installed"
    exit 1
fi

if [ "$1" = "delete" ]; then
    cliphist list | wofi --dmenu --prompt "Delete from clipboard" \
        --define allow_markup=false --define allow_images=false | cliphist delete
else
    cliphist list | wofi --dmenu --prompt "Clipboard" \
        --define allow_markup=false --define allow_images=false | cliphist decode | wl-copy
fi
