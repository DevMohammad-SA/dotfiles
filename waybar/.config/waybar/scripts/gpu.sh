#!/usr/bin/env bash
# Prints AMD GPU utilization (amdgpu sysfs) as JSON for waybar's custom module,
# with VRAM, temperature, power and clock in the tooltip. Prints empty text on
# machines without a busy counter (e.g. the T470's Intel iGPU) so the module hides.

device=""
for f in /sys/class/drm/card*/device/gpu_busy_percent; do
    [ -e "$f" ] || continue
    device=${f%/gpu_busy_percent}
    break
done

if [ -z "$device" ]; then
    echo '{"text":""}'
    exit 0
fi

usage=$(cat "$device/gpu_busy_percent")

class="normal"
if [ "$usage" -ge 90 ]; then
    class="critical"
elif [ "$usage" -ge 70 ]; then
    class="warning"
fi

read_val() { cat "$1" 2>/dev/null || echo 0; }

vram_used=$(read_val "$device/mem_info_vram_used")
vram_total=$(read_val "$device/mem_info_vram_total")
hwmon=$(echo "$device"/hwmon/hwmon*)
temp_edge=$(read_val "$hwmon/temp1_input")
temp_junction=$(read_val "$hwmon/temp2_input")
power=$(read_val "$hwmon/power1_average")
[ "$power" -gt 0 ] || power=$(read_val "$hwmon/power1_input")
sclk=$(awk '/\*/ { print $2 }' "$device/pp_dpm_sclk" 2>/dev/null)

tooltip=$(awk -v u="$usage" -v vu="$vram_used" -v vt="$vram_total" \
    -v te="$temp_edge" -v tj="$temp_junction" -v p="$power" -v clk="${sclk:-n/a}" \
    'BEGIN {
        printf "GPU %s%%  ·  %s\\n", u, clk
        if (vt > 0) printf "VRAM %.1f / %.1f GiB\\n", vu / 1073741824, vt / 1073741824
        printf "Temp %d°C edge  ·  %d°C junction\\n", te / 1000, tj / 1000
        printf "Power %.0f W", p / 1e6
    }')

printf '{"text":"%s%%","tooltip":"%s","class":"%s"}\n' "$usage" "$tooltip" "$class"
