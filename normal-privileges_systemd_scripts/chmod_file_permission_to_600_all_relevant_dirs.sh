#!/usr/bin/bash
user=`cut -d : -f 1 /etc/passwd | grep flo`
user_dir=/home/$user

find $user_dir/Pictures/ -type f -exec chmod 600 {} \;
find $user_dir/Pictures/ -type d -exec chmod 700 {} \;

find $user_dir/Documents/misc -type f -exec chmod 600 {} \;
find $user_dir/Documents/misc -type d -exec chmod 700 {} \;

find $user_dir/.config/Signal -type f -exec chmod 600 {} \;
find $user_dir/.config/Signal -type d -exec chmod 700 {} \;

find $user_dir/.config/fish -type f -exec chmod 600 {} \;
find $user_dir/.config/fish -type d -exec chmod 700 {} \;

find $user_dir/.local/share/fish -type f -exec chmod 600 {} \;
find $user_dir/.local/share/fish -type d -exec chmod 700 {} \;

find $user_dir/Documents/wir -type f -exec chmod 600 {} \;
find $user_dir/Documents/wir -type d -exec chmod 700 {} \;

