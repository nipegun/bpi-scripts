#!/bin/sh

# Ejeución remota:
#   curl -sL https://raw.githubusercontent.com/nipegun/bpi-scripts/refs/heads/main/r3-mini/NVMe-Temperatura-Medir.sh | sh

for d in /dev/nvme*n1; do
  [ -e "$d" ] || break

  nvme smart-log /dev/nvme0 2>/dev/null | while read vLinea; do
    case "$vLinea" in
      temperature*"C"*)
        vValor=$(echo "$vLinea" | tr -dc '0-9')
        echo "$(basename "$d")_composite=$vValor"
        ;;
      "Temperature Sensor"*)
        vSensor=$(echo "$vLinea" | tr -dc '0-9' | cut -c1)
        vValor=$(echo "$vLinea" | tr -dc '0-9' | sed 's/^.'"$vSensor"'//')
        echo "$(basename "$d")_sensor${vSensor}=$vValor"
        ;;
    esac
  done
done
