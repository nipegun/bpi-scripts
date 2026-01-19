#!/bin/sh

# Ejeución remota:
#   curl -sL https://raw.githubusercontent.com/nipegun/bpi-scripts/refs/heads/main/r3-mini/NVMe-Temperatura-Medir.sh | sh

for d in /dev/nvme*n1; do
  [ -e "$d" ] || break

  vDispositivo=$(basename "$d")

  nvme smart-log /dev/nvme0 2>/dev/null | while IFS= read -r vLinea; do
    case "$vLinea" in
      *"°C"*)
        vNombre=$(echo "$vLinea" \
          | cut -d':' -f1 \
          | tr ' ' '_' \
          | tr -cd 'a-zA-Z0-9_')

        vTemp=$(echo "$vLinea" \
          | sed 's/.*: *\([0-9]\+\) *°C.*/\1/')

        [ -n "$vNombre" ] && [ -n "$vTemp" ] && \
          echo "${vDispositivo}_${vNombre}=$vTemp"
        ;;
    esac
  done
done
