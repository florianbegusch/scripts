#!/usr/bin/env bash

set -u
set -e
set -o pipefail
#set -f  # disable globbing/filename expansion
shopt -s failglob  # error on unexpaned globs


script_file=~/Documents/scripts/set___user_rw_noone_else.sh


"$script_file" ~/.ssh
"$script_file" ~/.openstack
"$script_file" ~/.kube

"$script_file" ~/Pictures
"$script_file" ~/Documents/misc
[[ "$(uname)" = Darwin ]] || "$script_file" ~/Documents/wir

if [ "$(uname)" = Darwin ]; then
  config_path=~/Library/Application\ Support
else
  config_path=~/.config
fi
"$script_file" "$config_path"/Signal*
"$script_file" "$config_path"/'Standard Notes'
"$script_file" ~/'Standard Notes Backups'

"$script_file" "$config_path"/fish
"$script_file" ~/.local/share/fish
"$script_file" ~/.bash*

"$script_file" ~/.password-store -path ~/.password-store/.extensions -prune -o || true
"$script_file" ~/.password-store-work -path ~/.password-store-work/.extensions -prune -o || true
"$script_file" ~/.password-store-private -path ~/.password-store-private/.extensions -prune -o || true

"$script_file" ~/ISOs

