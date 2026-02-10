#!/bin/sh
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as sudo"
  exit 1
fi

cp -f enthium.kbd /etc/kanata/enthium.kbd

