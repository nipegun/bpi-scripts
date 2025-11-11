#!/bin/bash

sudo apt-get -y update
sudo apt-get -y install build-essential
sudo apt-get -y install libncurses5-dev
sudo apt-get -y install libncursesw5-dev
sudo apt-get -y install rsync


# Descargar el SDK correcto
wget https://downloads.openwrt.org/releases/24.10.4/targets/mediatek/filogic/openwrt-sdk-24.10.4-mediatek-filogic_gcc-13.3.0_musl.Linux-x86_64.tar.zst

# Descomprimir (necesitas zstd instalado)
tar --zstd -xf openwrt-sdk-24.10.4-mediatek-filogic_gcc-13.3.0_musl.Linux-x86_64.tar.zst

# O si tar no soporta --zstd directamente:
zstd -d openwrt-sdk-24.10.4-mediatek-filogic_gcc-13.3.0_musl.Linux-x86_64.tar.zst
tar xf openwrt-sdk-24.10.4-mediatek-filogic_gcc-13.3.0_musl.Linux-x86_64.tar

# Entrar al directorio
cd openwrt-sdk-24.10.4-mediatek-filogic_gcc-13.3.0_musl.Linux-x86_64

# Actualizar feeds
./scripts/feeds update -a

