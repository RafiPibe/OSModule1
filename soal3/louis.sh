#!/bin/bash

# Create directory for users.txt
mkdir -p /users

# Create users.txt if it does not exist
touch /users/users.txt

# Input username
read -p "Enter username: " username

# Check if username already exists in users.txt
if grep -q "^$username:" /users/users.txt; then
  # If username already exists, log error message and exit
  echo "$(date +"%Y/%m/%d %H:%M:%S") REGISTER: ERROR User already exists" >> log.txt
  echo "Error: User already exists"
  exit 1
fi

# Input password with conditions
while true; do
  read -s -p "Enter password (minimum 8 characters, at least 1 uppercase, 1 lowercase, alphanumeric, not chicken or ernie): " password
  if echo "$password" | grep -q "chicken"; then
  echo "Error: Password must be at least 8 characters, contain at least 1 uppercase letter, 1 lowercase letter, alphanumeric characters only, and not chicken or ernie."
  elif echo "$password" | grep -q "ernie"; then
  echo "Error: Password must be at least 8 characters, contain at least 1 uppercase letter, 1 lowercase letter, alphanumeric characters only, and not chicken or ernie."
  elif [[ ${#password} -ge 8 ]] && [[ "$password" =~ [A-Z] ]] && [[ "$password" =~ [a-z] ]] && [[ "$password" =~ ^[[:alnum:]]+$ ]] && [[ "$password" != "$username" ]] && [[ "$password" != "chicken" ]] && [[ "$password" != "ernie" ]]; then
    break
  fi
  echo "Error: Password must be at least 8 characters, contain at least 1 uppercase letter, 1 lowercase letter, alphanumeric characters only, and not chicken or ernie."
done

# Add username and hashed password to users.txt
echo "$username:$(echo "$password" | sha256sum | cut -d ' ' -f 1)" >> /users/users.txt

# Log successful registration
echo "$(date +"%Y/%m/%d %H:%M:%S") REGISTER: INFO User $username registered successfully" >> log.txt
echo "User $username registered successfully"

