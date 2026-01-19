#!/bin/sh

for z in /sys/class/thermal/thermal_zone*; do
  [ -e "$z" ] || break

  vNombre=$(cat "$z/type")
  vTempMilli=$(cat "$z/temp")

  vTempGrados=$((vTempMilli / 1000))

  echo "$vNombre=$vTempGrados"
done
