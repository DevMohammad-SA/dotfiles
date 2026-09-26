#!/usr/bin/env bash
# Wofi window switcher for sway: lists every open window (tiled, floating and
# scratchpad) as "[workspace] app — title" and focuses the one picked.

mapfile -t rows < <(swaymsg -t get_tree | jq -r '
    .. | objects | select(.type? == "workspace") as $ws
    | $ws | (.nodes[]?, .floating_nodes[]?) | recurse(.nodes[]?, .floating_nodes[]?)
    | select(.pid != null)
    | [.id, (if $ws.name == "__i3_scratch" then "scratch" else $ws.name end),
       (.app_id // .window_properties.class // "?"), (.name // "")]
    | @tsv')

[ "${#rows[@]}" -gt 0 ] || exit 0

ids=()
labels=()
for row in "${rows[@]}"; do
    IFS=$'\t' read -r id ws app title <<<"$row"
    ids+=("$id")
    labels+=("[$ws]  $app  —  $title")
done

# print_line_num returns the index of the picked row, so identical titles still
# resolve to the right window.
line=$(printf '%s\n' "${labels[@]}" |
    wofi --dmenu --prompt "Windows" --define dmenu-print_line_num=true \
        --define allow_markup=false --define allow_images=false)

[ -n "$line" ] && swaymsg "[con_id=${ids[$line]}] focus" >/dev/null
