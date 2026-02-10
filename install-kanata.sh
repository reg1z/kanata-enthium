#!/bin/sh
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as sudo"
  exit 1
fi

cargo install --root /usr kanata

mkdir -p /etc/kanata

cp -f enthium.kbd /etc/kanata/enthium.kbd

install -m 644 kanata.service /lib/systemd/system/kanata.service

systemctl enable --now kanata

