#!/usr/bin/env bash

if [ "$(iwgetid -r)" = iPhone ]; then
  set -x
  systemctl --user disable ***REMOVED***_and_***REMOVED***.service
  systemctl --user disable container-image-update.service
  systemctl --user disable infosec_pkgs_update.service

  systemctl --user stop ***REMOVED***_and_***REMOVED***.service
  systemctl --user stop container-image-update.service
  systemctl --user stop infosec_pkgs_update.service
  set +x
else
  set -x
  systemctl --user enable ***REMOVED***_and_***REMOVED***.service
  systemctl --user enable container-image-update.service
  systemctl --user enable infosec_pkgs_update.service
  set +x
fi

true
