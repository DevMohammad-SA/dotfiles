#!/bin/sh
# Usage: hw.sh <gputemp|vram|gpupower|nvme|fan|uptime>

hwmon_dirs() {
  for d in /sys/class/hwmon/hwmon*; do
    [ "$(cat "$d/name" 2>/dev/null)" = "$1" ] && echo "$d"
  done
}

out() { printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$1" "$2" "$3"; }
hide() { printf '{"text":""}\n'; }
cls() { # value warn crit
  if [ "$1" -ge "$3" ]; then
    echo critical
  elif [ "$1" -ge "$2" ]; then
    echo warning
  fi
}

case "$1" in
gputemp)
  d=$(hwmon_dirs amdgpu | head -n1)
  [ -n "$d" ] && [ -r "$d/temp1_input" ] || {
    hide
    exit 0
  }
  t=$(($(cat "$d/temp1_input") / 1000))
  out "󰔏 ${t}°" "GPU edge ${t}°C" "$(cls "$t" 80 95)"
  ;;
vram)
  for c in /sys/class/drm/card*/device; do
    [ -r "$c/mem_info_vram_used" ] && break
    c=""
  done
  [ -n "$c" ] || {
    hide
    exit 0
  }
  used=$(cat "$c/mem_info_vram_used")
  total=$(cat "$c/mem_info_vram_total")
  pct=$((used * 100 / total))
  out "󰍛 $((used / 1048576))M" "VRAM $((used / 1048576)) / $((total / 1048576)) MiB" "$(cls "$pct" 85 95)"
  ;;
gpupower)
  d=$(hwmon_dirs amdgpu | head -n1)
  f=""
  for n in power1_average power1_input; do
    [ -r "$d/$n" ] && f="$d/$n" && break
  done
  [ -n "$f" ] || {
    hide
    exit 0
  }
  w=$(($(cat "$f") / 1000000))
  out "󱐋 ${w}W" "GPU power ${w} W" ""
  ;;
nvme)
  max=0
  tip=""
  for d in $(hwmon_dirs nvme); do
    t=$(($(cat "$d/temp1_input") / 1000))
    [ "$t" -gt "$max" ] && max=$t
    tip="${tip}$(basename "$d") ${t}°C\\n"
  done
  [ "$max" -gt 0 ] || {
    hide
    exit 0
  }
  out "󰋊 ${max}°" "$tip" "$(cls "$max" 65 75)"
  ;;
fan)
  max=0
  tip=""
  for f in /sys/class/hwmon/hwmon*/fan*_input; do
    [ -r "$f" ] || continue
    r=$(cat "$f" 2>/dev/null)
    [ -n "$r" ] || continue
    n=$(cat "$(dirname "$f")/name" 2>/dev/null)
    tip="${tip}${n} $(basename "$f" _input): ${r} RPM\\n"
    [ "$r" -gt "$max" ] && max=$r
  done
  [ -n "$tip" ] || {
    hide
    exit 0
  }
  out "󰈐 ${max} rpm" "$tip" ""
  ;;
uptime)
  s=$(cut -d. -f1 /proc/uptime)
  d=$((s / 86400))
  h=$((s % 86400 / 3600))
  m=$((s % 3600 / 60))
  if [ "$d" -gt 0 ]; then t="${d}d ${h}h"; else t="${h}h ${m}m"; fi
  out "󰔟 $t" "Up since $(uptime -s)" ""
  ;;
*)
  hide
  ;;
esac
