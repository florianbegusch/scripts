#!/usr/bin/env bash

user=`cut -d : -f 1 /etc/passwd | grep flo`
user_dir=/home/$user
script_file=$user_dir/Documents/scripts/set___user_rw_noone_else.sh

$script_file $user_dir/Pictures/
$script_file $user_dir/Documents/misc
$script_file $user_dir/.config/Signal
$script_file $user_dir/.config/'Standard Notes'
$script_file $user_dir/'Standard Notes Backups'
$script_file $user_dir/.config/fish
$script_file $user_dir/.local/share/fish
$script_file $user_dir/Documents/wir
$script_file $user_dir/Downloads/ISOs

