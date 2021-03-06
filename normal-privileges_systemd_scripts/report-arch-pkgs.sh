#!/usr/bin/env bash
# shellcheck disable=SC1090

set -o pipefail  # propagate errors
set -u  # exit on undefined
set -e  # exit on non-zero return value
#set -f  # disable globbing/filename expansion
shopt -s failglob  # error on unexpaned globs


source ~/Documents/scripts/source-me/posix-compliant-shells.sh


dir=~/Documents/misc/arch
[ ! -d "$dir" ] && mkdir -p "$dir"

username="$(read_toml_setting ~/Documents/config/fastmail.conf username)"
fastmail_path='fastmail:'"$username"'.fastmail.com/files/-configs/arch'

if _rclone_verbose_sync_operation --delete-excluded "$fastmail_path" "$dir"; then

  # save list of pacman packages
  misc_arch_dir="$HOME/Documents/misc/arch"
  if [ ! -e "$misc_arch_dir" ]; then
    mkdir -p "$misc_arch_dir"
  fi

  # backup pacman database
  ## to restore move .tar.bz2 file to / and execute "tar -xjvf pacman_database.tar.bz2"
  tar -cjf "$misc_arch_dir/pacman_database.tar.bz2" "/var/lib/pacman/local"

  pacman -Qqem > "$misc_arch_dir/packages_explicit_external"
  pacman -Qqen > "$misc_arch_dir/packages_explicit_internal"
  pacman -Qqm  > "$misc_arch_dir/packages_all_external"
  pacman -Qqn  > "$misc_arch_dir/packages_all_internal"

  _rclone_verbose_sync_operation --delete-excluded "$dir" "$fastmail_path"

fi

