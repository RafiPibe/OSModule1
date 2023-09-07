#!/bin/bash

decrypt_file() {
  encrypted_filepath="$1"
  decrypted_filepath="$2"
  current_hour=$(date "+%H")
  lowercase_alphabet=$(echo -e 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz')
  uppercase_alphabet=$(echo -e 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ')
  cat "${encrypted_filepath}" | tr "${lowercase_alphabet:${current_hour}:26}${uppercase_alphabet:${current_hour}:26}" "${lowercase_alphabet:0:26}${uppercase_alphabet:0:26}" > "${decrypted_filepath}"
}

encrypted_dir="/home/wildan/backup/encrypt"
decrypted_dir="/home/wildan/backup/decrypt"

latest_encrypted_file=$(ls -t "${encrypted_dir}" | head -n 1)
encrypted_filepath="${encrypted_dir}/${latest_encrypted_file}"
decrypted_filepath="${decrypted_dir}/${latest_encrypted_file}"

if [ -f "${encrypted_filepath}" ]; then
  mkdir -p "${decrypted_dir}"
  decrypt_file "${encrypted_filepath}" "${decrypted_filepath}"
fi

