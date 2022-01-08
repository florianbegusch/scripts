#!/usr/bin/env bash

services=()
services+=('bibi_and_benjamin.service')
services+=('container-image-update.service')
services+=('infosec_pkgs_update.service')

if [ "$(iwgetid -r)" = iPhone ] || [ "$1" = -f ]; then
  for service in "${services[@]}"; do
    set -x
    systemctl stop --user "$service"
    set +x
  done
fi

unset services

services+=('container-image-update.service')
services+=('infosec_pkgs_update.service')

if [ "$(iwgetid -r)" = iPhone ] || [ "$1" = -f ]; then
  for service in "${services[@]}"; do
    set -x
    systemctl stop --user "$service"
    set +x
  done
fi

unset services

true
