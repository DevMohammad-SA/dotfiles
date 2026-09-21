#!/usr/bin/env bash
# Prints AMD GPU utilization (amdgpu sysfs) as JSON for waybar's custom module.

usage=0
for f in /sys/class/drm/card*/device/gpu_busy_percent; do
    [ -e "$f" ] || continue
    usage=$(cat "$f")
    break
done

class="normal"
if [ "$usage" -ge 90 ]; then
    class="critical"
elif [ "$usage" -ge 70 ]; then
    class="warning"
fi

printf '{"text":"%s%%","class":"%s"}\n' "$usage" "$class"
