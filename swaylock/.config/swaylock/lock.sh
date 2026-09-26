#!/usr/bin/env bash
# Locks the screen over a blurred, darkened screenshot of each output.
# swaylock-effects: blur, vignette, clock and fade-in come from the fork itself.
# Plain swaylock: the blur is pre-rendered with grim + ImageMagick, falling back
# to the solid color in the config if either tool is missing.
# Extra arguments are passed through to swaylock.

pgrep -x swaylock >/dev/null && exit 0

if ! command -v swaylock >/dev/null; then
    notify-send -u normal "Lock" "swaylock is not installed"
    exit 1
fi

if swaylock --help 2>&1 | grep -q -- '--effect-blur'; then
    exec swaylock --screenshots --effect-blur 8x4 --effect-vignette 0.4:0.6 \
        --indicator --clock --timestr '%I:%M %p' --datestr '%a %d %b' \
        --fade-in 0.2 "$@"
fi

args=()
# Screenshots live in the per-user runtime dir and are removed once swaylock
# has loaded them (the config daemonizes, so swaylock returns after locking).
tmp=$(mktemp -d "${XDG_RUNTIME_DIR:-/tmp}/lock.XXXXXX")
trap 'rm -rf "$tmp"' EXIT

if command -v grim >/dev/null && command -v magick >/dev/null; then
    for output in $(swaymsg -t get_outputs | jq -r '.[] | select(.active) | .name'); do
        img="$tmp/$output.png"
        grim -o "$output" -t ppm - |
            magick ppm:- -scale 10% -blur 0x3 -resize 1000% -modulate 65 "$img" &&
            args+=(-i "$output:$img")
    done
fi

swaylock "${args[@]}" "$@"
