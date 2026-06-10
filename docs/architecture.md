# Secure SSH Access Automation - Architecture

## Overview

This project demonstrates secure SSH access management and automation on Linux systems using Bash scripting and Ansible.

## Components

### SSH Key Generation

* Generates Ed25519 SSH key pairs
* Stores keys in the user's `.ssh` directory
* Supports secure key-based authentication

### SSH Hardening

* Disables root login
* Disables password authentication
* Enables public key authentication
* Restricts server access to authorized users

### Ansible Automation

* Creates and manages SSH configuration
* Deploys public keys to `authorized_keys`
* Verifies successful configuration
* Demonstrates Infrastructure Automation concepts

### SSH Key Rotation

* Backs up existing SSH keys
* Generates new SSH key pairs
* Supports key lifecycle management

### SSH Connectivity Validation

* Tests SSH access using automation
* Verifies authentication and connectivity
* Executes remote commands to confirm successful login

## Architecture Flow

```text
Windows Host
      │
      ▼
Ubuntu VM (devops-master)
      │
      ├── generate_ssh_key.sh
      ├── rotate_ssh_key.sh
      ├── test_ssh_connection.sh
      │
      ▼
Ansible Playbook
      │
      ▼
SSH Configuration
      │
      ▼
Authorized Access Validation
```

## Technologies Used

* Linux (Ubuntu 24.04)
* OpenSSH
* Bash
* Ansible
* Git
* GitHub

## Skills Demonstrated

* Linux Administration
* SSH Security
* Bash Scripting
* Ansible Automation
* Configuration Management
* Infrastructure Automation
* Troubleshooting
