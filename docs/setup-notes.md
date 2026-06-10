## Step 1 - Project Setup

- Created project folder: `secure-ssh-access-automation`
- Initialized Git repository using `git init`
- Created project structure:
  - `docs/`
  - `scripts/`
  - `ansible/`
  - `.github/workflows/`
  - `screenshots/`
- Added initial `README.md` with project overview
- Created `.gitignore` to exclude sensitive files such as SSH keys, logs, and environment files
- Made scripts executable
- Performed initial Git commit

## Step 2 - SSH Key Generation and Login Test

- Generated Ed25519 SSH key pair for the project
- Stored keys in `~/.ssh/secure_ssh_project_key`
- Automated key generation using script
- Copied public key to Linux server using `ssh-copy-id`
- Verified passwordless SSH login
- Confirmed key entry in `~/.ssh/authorized_keys`
- Set secure permissions:
  - `~/.ssh` → `700`
  - `authorized_keys` → `600`

## Step 3 - Linux Server Hardening

### Objective

Secure SSH access by eliminating insecure authentication methods and enforcing key-based authentication.

### Environment

- Server IP: `<local-server-ip>`
- OS: Ubuntu 24.04 LTS

### Actions Performed

- Created a backup of the SSH configuration file:
  - `/etc/ssh/sshd_config` → `sshd_config.backup`
- Disabled root login:
  - `PermitRootLogin no`
- Disabled password-based authentication:
  - `PasswordAuthentication no`
- Enabled public key authentication:
  - `PubkeyAuthentication yes`
- Disabled challenge-response authentication:
  - `ChallengeResponseAuthentication no`
- Restricted SSH access to a specific user:
  - `AllowUsers deepika`

### Configuration Approach

- Updated `sshd_config` by adding security settings at the end of the file to override defaults
- Restarted SSH service to apply changes:
  - `sudo systemctl restart ssh`

### Verification

- Verified successful SSH login using key-based authentication:
  - `ssh -i ~/.ssh/secure_ssh_project_key deepika@<local-server-ip>`
- Verified password-based login is blocked:
  - `ssh deepika@<local-server-ip>`
  - Result: `Permission denied (publickey)`

### Security Outcome

- Eliminated risk of brute-force attacks by disabling password authentication
- Enforced secure SSH key-based access
- Restricted access to authorized users only
- Strengthened overall Linux server security posture

### Notes

- Verified SSH key permissions:
  - `~/.ssh` → `700`
  - `~/.ssh/authorized_keys` → `600`
- Maintained an active session during configuration to prevent lockout

## Step 4 - Ansible SSH Key Automation

### Objective
Automate SSH key distribution using Ansible.

### Environment
- Single-node lab environment
- Control Node: Ubuntu VM
- Managed Node: localhost
- Inventory: `localhost ansible_connection=local`

### Actions Performed
- Created Ansible inventory file: `ansible/inventory.ini`
- Created Ansible playbook: `ansible/playbook.yml`
- Automated creation of `.ssh` directory with secure permissions
- Automated addition of SSH public key into `authorized_keys`
- Verified `authorized_keys` exists using Ansible `stat` module

### Verification
- Ran:
  - `ansible-playbook -i inventory.ini playbook.yml`
- Result:
  - `ok=5`
  - `changed=1`
  - `failed=0`
- Verification message:
  - `authorized_keys exists: True`

### Outcome
- Automated SSH key management using Ansible
- Reduced manual SSH key setup
- Demonstrated configuration management and Linux automation skills

### Skills Demonstrated

- Linux Administration
- SSH Key Management
- Ansible Automation
- Configuration Management

## Step 5 - SSH Key Rotation Script

### Objective
Implement SSH key rotation to replace old keys with new keys while keeping a backup for recovery.

### Actions Performed
- Created `scripts/rotate_ssh_key.sh`
- Backed up existing SSH private and public keys before rotation
- Generated a new Ed25519 SSH key pair
- Applied secure permissions to the new key files
- Re-ran Ansible playbook to deploy the new public key

### Verification
- Confirmed old key was backed up
- Confirmed new key pair was generated
- Verified new public key was added to `authorized_keys`
- Tested SSH login using the rotated key

### Outcome
- Demonstrated SSH key lifecycle management
- Improved security by supporting key rotation
- Added practical Linux administration automation

## Step 6 - SSH Connection Validation Script

### Objective

Automate SSH connectivity testing to validate server access and authentication.

### Actions Performed

- Created `scripts/test_ssh_connection.sh`
- Implemented server IP validation
- Automated SSH connection testing using key-based authentication
- Executed remote hostname command to verify successful login

### Verification

Executed:

`./test_ssh_connection.sh <server-ip>`

Result:

- SSH connection established successfully
- Remote hostname returned:
  - `devops-master`

### Outcome

- Automated SSH access validation
- Simplified connectivity troubleshooting
- Demonstrated Bash scripting and Linux automation skills

### Skills Demonstrated

- Bash Scripting
- Linux Administration
- SSH Authentication
- Automation
- Troubleshooting