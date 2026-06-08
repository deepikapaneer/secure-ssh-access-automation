#!/bin/bash

SSH_DIR="$HOME/.ssh"
KEY_NAME="secure_ssh_project_key"
KEY_PATH="$SSH_DIR/$KEY_NAME"
BACKUP_DIR="$SSH_DIR/key_backup_$(date +%Y%m%d_%H%M%S)"
COMMENT="secure-ssh-access-automation-rotated"

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

if [ -f "$KEY_PATH" ]; then
  mkdir -p "$BACKUP_DIR"
  mv "$KEY_PATH" "$BACKUP_DIR/"
  mv "$KEY_PATH.pub" "$BACKUP_DIR/" 2>/dev/null
  echo "Old SSH key backed up to: $BACKUP_DIR"
else
  echo "No existing key found. Creating a new key."
fi

ssh-keygen -t ed25519 -C "$COMMENT" -f "$KEY_PATH"

chmod 600 "$KEY_PATH"
chmod 644 "$KEY_PATH.pub"

echo "New SSH key generated successfully."
echo "New public key:"
cat "$KEY_PATH.pub"