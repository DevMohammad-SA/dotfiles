#!/usr/bin/env bash
# Mako do-not-disturb indicator. `notifications.sh toggle` flips the mode and
# signals waybar (SIGRTMIN+8) so the icon updates immediately.

if [ "$1" = "toggle" ]; then
    makoctl mode -t do-not-disturb >/dev/null
    pkill -RTMIN+8 -x waybar
    exit 0
fi

waiting=$(makoctl list -j 2>/dev/null | jq 'length' 2>/dev/null || echo 0)

if makoctl mode 2>/dev/null | grep -qx do-not-disturb; then
    printf '{"text":"󰂛","tooltip":"Do not disturb: on\\nClick to turn off · Right-click: restore last","class":"dnd"}\n'
else
    printf '{"text":"󰂚","tooltip":"Notifications: on (%s showing)\\nClick for do not disturb · Right-click: restore last · Middle: dismiss all","class":"normal"}\n' "$waiting"
fi
