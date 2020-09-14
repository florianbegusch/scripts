#!/usr/bin/env bash

set -o pipefail  # propagate errors
set -u  # exit on undefined
set -e  # exit on non-zero return value
#set -f  # disable globbing/filename expansion
shopt -s failglob  # error on unexpaned globs

source ~/.sh_functions

dir=~/Documents/misc/mac-os
[ ! -d "$dir" ] && mkdir "$dir"

username="$(read_toml_setting ~/Documents/config/fastmail.conf username)"
rclone sync --exclude .DS_Store --delete-excluded -v 'fastmail:'$username'.fastmail.com/files/-configs/mac-os' "$dir"

#brew info --installed --json | jq .[].name | sed 's#"##g' > ~/Documents/misc/mac-os/brew-pkgs.txt
brew list > "$dir"/brew-pkgs.txt
brew cask list > "$dir"/brew-cask-pkgs.txt
kubectl krew list > "$dir"/krew-pkgs.txt

rclone sync --exclude .DS_Store --delete-excluded -v "$dir" 'fastmail:'$username'.fastmail.com/files/-configs/mac-os'
