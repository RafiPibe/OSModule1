#!/bin/bash

current_hour=$(date "+%H")
current_date=$(date "+%H:%M %d:%m:%Y")

backup_dir="/home/wildan/backup/encrypt"
backup_filename="${backup_dir}/${current_date}.txt"

mkdir -p "${backup_dir}"

lowercase_alphabet="abcdefghijklmnopqrstuvwxyz"
uppercase_alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

lowercase_shifted="${lowercase_alphabet:${current_hour}}${lowercase_alphabet:0:${current_hour}}"
uppercase_shifted="${uppercase_alphabet:${current_hour}}${uppercase_alphabet:0:${current_hour}}"

full_alphabet="${lowercase_alphabet}${uppercase_alphabet}"
shifted_alphabet="${lowercase_shifted}${uppercase_shifted}"

tr "${full_alphabet}" "${shifted_alphabet}" < /var/log/syslog > "${backup_filename}"

