#!/bin/bash

SERVER_IP="$1"
SSH_KEY="$HOME/.ssh/secure_ssh_project_key"

if [ -z "$SERVER_IP" ]; then
  echo "Usage: ./test_ssh_connection.sh <server-ip>"
  exit 1
fi

echo "Testing SSH connection to <private-ip>"

ssh -i "$SSH_KEY" \
    -o BatchMode=yes \
    -o ConnectTimeout=5 \
    deepika@"$SERVER_IP" "hostname"

if [ $? -eq 0 ]; then
    echo "SSH connection successful."
else
    echo "SSH connection failed."
fi