#!/usr/bin/env bash

set -u
set -e
set -o pipefail
#set -f  # disable globbing/filename expansion
shopt -s failglob  # error on unexpaned globs


script_file=~/Documents/scripts/set___user_rw_noone_else.sh

set -x

$script_file ~/Pictures
$script_file ~/Documents/misc
[[ "$(uname)" = Darwin ]] || $script_file ~/Documents/wir

[[ "$(uname)" = Darwin ]] && $script_file ~/Library/Application\ Support/Signal/ || $script_file ~/.config/Signal*
[[ "$(uname)" = Darwin ]] && $script_file ~/Library/'Application Support/Standard Notes' || $script_file ~/.config/'Standard Notes'
$script_file ~/'Standard Notes Backups'

$script_file ~/.config/fish
$script_file ~/.local/share/fish
$script_file ~/.bash*

$script_file ~/Documents/passwds
$script_file ~/.openstack
$script_file ~/.kube

$script_file ~/ISOs

set +x

