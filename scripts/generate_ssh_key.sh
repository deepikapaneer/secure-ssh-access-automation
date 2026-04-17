#!/bin/bash

KEY_PATH="$HOME/.ssh/secure_ssh_project_key"
COMMENT="secure-ssh-access-automation"

if [ -f "$KEY_PATH" ]; then
  echo "SSH key already exists at $KEY_PATH"
else
  ssh-keygen -t ed25519 -C "$COMMENT" -f "$KEY_PATH"
  echo "SSH key generated successfully."
fi

echo "Public key:"
cat "${KEY_PATH}.pub"