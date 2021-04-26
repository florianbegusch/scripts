#!/usr/bin/env bash

services=()
services+=('***REMOVED***_and_***REMOVED***.service')
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
