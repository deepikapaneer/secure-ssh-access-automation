# Setup Notes - Secure SSH Access Automation

## Step 1 - Project Setup

### Objective

Create a structured GitHub project for SSH security automation and Linux administration.

### Actions Performed

* Created project folder: `secure-ssh-access-automation`
* Initialized Git repository using `git init`
* Created project structure:

  * `docs/`
  * `scripts/`
  * `ansible/`
  * `.github/workflows/`
  * `screenshots/`
* Added initial `README.md`
* Created `.gitignore` to exclude sensitive files such as SSH keys, logs, and environment files
* Made scripts executable
* Performed initial Git commit

### Outcome

* Established a structured project repository
* Prepared environment for Linux automation development

---

## Step 2 - SSH Key Generation and Login Test

### Objective

Implement secure SSH key-based authentication.

### Actions Performed

* Generated Ed25519 SSH key pair

* Stored keys in:

  `~/.ssh/secure_ssh_project_key`

* Automated key generation using Bash script

* Copied public key to Linux server using `ssh-copy-id`

* Verified passwordless SSH login

* Confirmed public key entry in:

  `~/.ssh/authorized_keys`

* Applied secure permissions:

  * `.ssh` → `700`
  * `authorized_keys` → `600`

### Verification

Successfully connected using:

`ssh -i ~/.ssh/secure_ssh_project_key deepika@<private-ip>`

### Outcome

* Implemented secure SSH key authentication
* Eliminated dependency on password-based access

---

## Step 3 - Linux Server Hardening

### Objective

Secure SSH access by eliminating insecure authentication methods and enforcing key-based authentication.

### Environment

* Server Type: Ubuntu Linux Server Lab Environment
* OS: Ubuntu 24.04 LTS

### Actions Performed

Initial hardening was performed manually to validate the configuration:

* Created backup of SSH configuration file
* Disabled root login
* Disabled password authentication
* Enabled public key authentication
* Disabled keyboard-interactive authentication
* Restricted SSH access to authorized users

### Hardening Configuration

```text
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
KbdInteractiveAuthentication no
AllowUsers deepika
```

### Verification

* Verified successful SSH login using SSH keys
* Verified password-based login was blocked
* Confirmed active SSH configuration using:

  `sudo sshd -T`

### Security Outcome

* Reduced brute-force attack risk
* Enforced SSH key-based authentication
* Restricted server access to authorized users
* Improved overall Linux server security

### Notes

* Initial hardening was performed manually
* SSH hardening was later automated using Ansible in Step 4

---

## Step 4 - Ansible SSH Access Automation

### Objective

Automate SSH key deployment and SSH security hardening using Ansible.

### Environment

* Ubuntu 24.04 LTS
* Single-node lab environment
* Control Node: Ubuntu VM
* Managed Node: localhost

### Files Created

* `ansible/inventory.ini`
* `ansible/ansible.cfg`
* `ansible/playbook.yml`

### Actions Performed

The Ansible playbook automates:

* Creation of `.ssh` directory
* Application of secure directory permissions
* Deployment of SSH public key to `authorized_keys`
* Verification of SSH key deployment
* Disabling root login
* Disabling password authentication
* Enabling public key authentication
* Disabling keyboard-interactive authentication
* Automatic SSH service restart
* Verification of effective SSH configuration

### Verification

Executed:

`ansible-playbook playbook.yml`

Results:

* SSH public key deployed successfully
* SSH hardening configuration applied successfully
* SSH service restarted automatically
* Effective SSH configuration verified

### Outcome

* Automated SSH access management
* Automated SSH hardening
* Reduced manual administration effort
* Improved configuration consistency
* Demonstrated Infrastructure Automation and Configuration Management

### Skills Demonstrated

* Linux Administration
* SSH Security
* SSH Hardening
* SSH Key Management
* Ansible Automation
* Configuration Management
* Infrastructure as Code (IaC)

---

## Step 5 - SSH Key Rotation Script

### Objective

Implement SSH key rotation to replace old keys with new keys while maintaining backup copies for recovery.

### Actions Performed

* Created:

  `scripts/rotate_ssh_key.sh`

* Backed up existing SSH keys

* Generated new Ed25519 SSH key pair

* Applied secure file permissions

* Re-ran Ansible playbook to deploy updated public key

### Verification

* Confirmed backup directory creation
* Confirmed new SSH key generation
* Verified public key deployment
* Successfully authenticated using rotated SSH key

### Outcome

* Demonstrated SSH key lifecycle management
* Improved security through credential rotation
* Added practical Linux administration automation

---

## Step 6 - SSH Connection Validation Script

### Objective

Automate SSH connectivity testing and authentication validation.

### Actions Performed

Created:

`scripts/test_ssh_connection.sh`

The script:

* Accepts server IP as input
* Validates SSH connectivity
* Uses SSH key authentication
* Executes remote hostname command
* Reports success or failure

### Verification

Executed:

`./test_ssh_connection.sh <private-ip>`

Result:

```text
Testing SSH connection to <private-ip>
devops-master
SSH connection successful.
```

### Outcome

* Automated SSH connectivity validation
* Simplified troubleshooting
* Verified post-deployment access
* Demonstrated Bash scripting and Linux automation

### Skills Demonstrated

* Bash Scripting
* Linux Administration
* SSH Authentication
* Automation
* Troubleshooting

---

## Project Outcomes

This project successfully automated:

* SSH key generation
* SSH key deployment
* SSH security hardening
* SSH key rotation
* SSH connectivity validation

Technologies used:

* Ubuntu Linux
* OpenSSH
* Bash
* Ansible
* Git
* GitHub

Key skills demonstrated:

* Linux Administration
* SSH Security
* Bash Scripting
* Ansible Automation
* Configuration Management
* Infrastructure Automation
* Troubleshooting
