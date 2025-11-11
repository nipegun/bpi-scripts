
#!/bin/bash

# ----------
# Script de NiPeGun para Instalar el SDK de OpenWrt para Mediatek Filogic
#
# Ejecución remota (puede requerir permisos sudo):
#   curl -sL https://raw.githubusercontent.com/nipegun/bpi-scripts/refs/heads/main/r3/debian/OpenWrtSDK-23.05.6-Install.sh | bash
# ----------

# Instalar requisitos
  sudo apt-get -y update
  sudo apt-get -y install build-essential
  sudo apt-get -y install libncurses5-dev
  sudo apt-get -y install libncursesw5-dev
  sudo apt-get -y install rsync

# Crear la carpeta
  mkdir -p $HOME/OpenWrtSDK/bpi-r3/23.05.6/
  cd $HOME/OpenWrtSDK/bpi-r3/23.05.6/

# Descargar el SDK correcto
  wget https://downloads.openwrt.org/releases/23.05.6/targets/mediatek/filogic/openwrt-sdk-23.05.6-mediatek-filogic_gcc-12.3.0_musl.Linux-x86_64.tar.xz

# Descomprimir (necesitas zstd instalado)
  tar --zstd -xf openwrt-sdk-23.05.6-mediatek-filogic_gcc-12.3.0_musl.Linux-x86_64.tar.xz

# O si tar no soporta --zstd directamente:
  zstd -d openwrt-sdk-23.05.6-mediatek-filogic_gcc-12.3.0_musl.Linux-x86_64.tar.xz
  tar xf openwrt-sdk-23.05.6-mediatek-filogic_gcc-12.3.0_musl.Linux-x86_64.tar.xz

# Entrar al directorio
  cd openwrt-sdk-23.05.6-mediatek-filogic_gcc-12.3.0_musl.Linux-x86_64

# Actualizar feeds
  ./scripts/feeds update -a
