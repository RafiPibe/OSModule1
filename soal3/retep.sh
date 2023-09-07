#!/bin/bash

# Input username
read -p "Enter username: " username

# Check if username exists in users.txt
if ! grep -q "^$username:" /users/users.txt; then
  # If username does not exist, log error message and exit
  echo "$(date +"%Y/%m/%d %H:%M:%S") LOGIN: ERROR Failed login attempt on user $username" >> log.txt
  echo "Error: Invalid username or password"
  exit 1
fi

# Input password
read -s -p "Enter password: " password
echo

# Check if password is correct
hashed_password=$(grep "^$username:" /users/users.txt | cut -d ':' -f 2)
if [[ $(echo "$password" | sha256sum | cut -d ' ' -f 1) == "$hashed_password" ]]; then
  # If password is correct, log successful login
  echo "$(date +"%Y/%m/%d %H:%M:%S") LOGIN: INFO User $username logged in" >> log.txt
  echo "Welcome, $username!"
else
  # If password is incorrect, log error message and exit
  echo "$(date +"%Y/%m/%d %H:%M:%S") LOGIN: ERROR Failed login attempt on user $username" >> log.txt
  echo "Error: Invalid username or password"
  exit 1
fi