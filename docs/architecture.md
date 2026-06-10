# Secure SSH Access Automation - Architecture

## Overview

This project demonstrates secure SSH access management and automation on Linux systems using Bash scripting and Ansible.

The solution automates SSH key generation, SSH key deployment, SSH server hardening, SSH key rotation, and connectivity validation to improve security and reduce manual administration effort.

---

## Components

### SSH Key Generation

**Script:** `generate_ssh_key.sh`

Purpose:

* Generates Ed25519 SSH key pairs
* Stores keys securely in the user's `.ssh` directory
* Supports passwordless SSH authentication

Output:

* Private Key: `secure_ssh_project_key`
* Public Key: `secure_ssh_project_key.pub`

---

### SSH Hardening

Purpose:

* Improve SSH security
* Reduce attack surface
* Enforce secure authentication methods

Hardening Configuration:

```text
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
KbdInteractiveAuthentication no
AllowUsers deepika
```

Security Benefits:

* Prevents root login over SSH
* Eliminates password-based authentication
* Enforces SSH key authentication
* Restricts access to authorized users only

---

### Ansible Automation

**Files:**

* `ansible/playbook.yml`
* `ansible/inventory.ini`
* `ansible/ansible.cfg`

Purpose:

Automate Linux server access configuration and SSH security hardening.

Functions:

* Creates `.ssh` directory with secure permissions
* Deploys SSH public key to `authorized_keys`
* Verifies key deployment
* Applies SSH hardening settings
* Restarts SSH service automatically
* Verifies effective SSH configuration

Benefits:

* Reduces manual server administration
* Ensures consistent configuration
* Supports Infrastructure as Code (IaC) principles
* Enables repeatable server provisioning

---

### SSH Key Rotation

**Script:** `rotate_ssh_key.sh`

Purpose:

* Backup existing SSH keys
* Generate new Ed25519 key pairs
* Support SSH key lifecycle management

Benefits:

* Improves security posture
* Supports credential rotation best practices
* Reduces risk of compromised keys

---

### SSH Connectivity Validation

**Script:** `test_ssh_connection.sh`

Purpose:

* Validate SSH connectivity
* Verify key-based authentication
* Confirm server accessibility

Validation Steps:

* Connect using SSH key authentication
* Execute remote hostname command
* Return success or failure status

Benefits:

* Simplifies troubleshooting
* Confirms successful configuration
* Verifies post-deployment access

---

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
      ├── SSH Key Deployment
      ├── SSH Hardening
      ├── SSH Service Restart
      └── Configuration Verification
      │
      ▼
Secure Linux Server Access
```

---

## Technologies Used

* Ubuntu 24.04 LTS
* OpenSSH
* Bash Scripting
* Ansible
* Git
* GitHub

---

## Skills Demonstrated

* Linux Administration
* SSH Security
* SSH Key Management
* SSH Hardening
* Bash Scripting
* Ansible Automation
* Configuration Management
* Infrastructure as Code (IaC)
* Troubleshooting
* System Automation

---

## Project Outcomes

* Automated SSH key deployment
* Automated SSH security hardening
* Automated SSH key rotation
* Automated connectivity validation
* Improved Linux server security
* Reduced manual administration effort
* Demonstrated real-world Linux automation practices
