#!/bin/sh

# Ejecución remota:
#  curl -sL https://raw.githubusercontent.com/nipegun/bpi-scripts/refs/heads/main/r3/openwrt/Temperatura-Medir.sh | sh

for z in /sys/class/thermal/thermal_zone*; do
  [ -e "$z" ] || break

  vNombre=$(cat "$z/type")
  vTempMilli=$(cat "$z/temp")

  vTempGrados=$((vTempMilli / 1000))

  echo "$vNombre=$vTempGrados"
done
