#!/usr/bin/env bash
# Prints the active keyboard layout (en/ar), uppercased while Caps Lock is on.

layout=$(swaymsg -t get_inputs | jq -r '[.[] | select(.type == "keyboard") | .xkb_active_layout_name][0] // empty')

case "$layout" in
    *Arabic*) short="ar" ;;
    *English*) short="en" ;;
    *) short="${layout:0:2}" ;;
esac

caps=0
for led in /sys/class/leds/*capslock/brightness; do
    [ -e "$led" ] || continue
    if [ "$(cat "$led" 2>/dev/null)" = "1" ]; then
        caps=1
        break
    fi
done

if [ "$caps" = "1" ]; then
    echo "${short^^}"
else
    echo "$short"
fi
