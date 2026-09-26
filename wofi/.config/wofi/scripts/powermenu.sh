#!/usr/bin/env bash
# Wofi power menu: lock / logout / suspend / reboot / shutdown.
# Destructive actions (logout, reboot, shutdown) ask for confirmation.

menu() {
    wofi --dmenu --prompt "$1" --width 280 --lines "$2" \
        --cache-file /dev/null --sort-order default \
        --define allow_images=false --define hide_scroll=true
}

# Themed lock from the swaylock package; returns once the screen is locked
lock() {
    "$HOME/.config/swaylock/lock.sh"
}

confirm() {
    [ "$(printf '󰄬  Yes, %s\n󰜺  Cancel\n' "$1" | menu "$1?" 2)" = "󰄬  Yes, $1" ]
}

choice=$(printf '%s\n' "󰌾  Lock" "󰤄  Suspend" "󰍃  Logout" "󰜉  Reboot" "󰐥  Shutdown" | menu "Power" 5)

case "$choice" in
    *Lock)     lock ;;
    *Suspend)  lock; systemctl suspend ;;
    *Logout)   confirm "log out" && swaymsg exit ;;
    *Reboot)   confirm "reboot" && systemctl reboot ;;
    *Shutdown) confirm "shut down" && systemctl poweroff ;;
esac
