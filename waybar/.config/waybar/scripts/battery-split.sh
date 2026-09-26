#!/usr/bin/env bash
# Per-battery breakdown for dual-battery laptops (ThinkPad T470: BAT0 internal,
# BAT1 external/hot-swappable). Prints nothing with fewer than two batteries so
# the module hides itself on the desktop, or on the T470 with the rear pack out.

shopt -s nullglob
bats=(/sys/class/power_supply/BAT*)
[ "${#bats[@]}" -ge 2 ] || { echo '{"text":""}'; exit 0; }

read_val() { cat "$1" 2>/dev/null || echo 0; }

label() {
    case "$1" in
        BAT0) echo "int" ;;
        BAT1) echo "ext" ;;
        *)    echo "${1,,}" ;;
    esac
}

text=""
tooltip=""
class="idle"
for bat in "${bats[@]}"; do
    name=${bat##*/}
    capacity=$(read_val "$bat/capacity")
    status=$(cat "$bat/status" 2>/dev/null || echo Unknown)

    # Newer kernels expose energy_* (µWh) for ThinkPads; some firmware uses charge_* (µAh).
    if [ -e "$bat/energy_full" ]; then
        now=$(read_val "$bat/energy_now"); full=$(read_val "$bat/energy_full")
        design=$(read_val "$bat/energy_full_design"); unit="Wh"
    else
        now=$(read_val "$bat/charge_now"); full=$(read_val "$bat/charge_full")
        design=$(read_val "$bat/charge_full_design"); unit="Ah"
    fi
    power=$(read_val "$bat/power_now")
    cycles=$(read_val "$bat/cycle_count")
    health=0
    [ "$design" -gt 0 ] && health=$(( full * 100 / design ))

    marker=""
    case "$status" in
        Charging)    marker="↑"; class="charging" ;;
        Discharging) marker="↓"; [ "$class" = "charging" ] || class="discharging" ;;
    esac

    [ -n "$text" ] && text+=" · "
    text+="$(label "$name") ${capacity}${marker}"

    [ -n "$tooltip" ] && tooltip+="\n\n"
    tooltip+=$(awk -v n="$name ($(label "$name"))" -v c="$capacity" -v s="$status" \
        -v now="$now" -v full="$full" -v u="$unit" -v p="$power" -v h="$health" -v cy="$cycles" \
        'BEGIN {
            printf "<b>%s</b>  %s%%  %s\\n", n, c, s
            printf "%.1f / %.1f %s", now / 1e6, full / 1e6, u
            if (p > 0) printf "  ·  %.1f W", p / 1e6
            printf "\\nHealth %s%%  ·  %s cycles", h, cy
        }')
done

printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$text" "$tooltip" "$class"
