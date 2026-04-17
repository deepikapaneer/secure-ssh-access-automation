## Step 1 - Project Setup

- Created project folder: secure-ssh-access-automation
- Initialized Git repository using `git init`
- Created project structure:
  - docs/
  - scripts/
  - ansible/
  - .github/workflows/
  - screenshots/
- Added initial README.md with project overview
- Created .gitignore to exclude sensitive files (SSH keys, logs, env files)
- Made scripts executable
- Performed initial Git commit

---

## Step 2 - SSH Key Generation and Login Test

- Generated Ed25519 SSH key pair for the project
- Stored keys in ~/.ssh/secure_ssh_project_key
- Automated key generation using script
- Copied public key to Linux server using ssh-copy-id
- Verified passwordless SSH login
- Confirmed key entry in ~/.ssh/authorized_keys
- Set secure permissions:
  - ~/.ssh → 700
  - authorized_keys → 600

  ## Step 3 - Linux Server Hardening

### Objective
Secure SSH access by disabling insecure authentication methods and enforcing key-based login.

### Environment
- Server IP: <local-server-ip>
- OS: Ubuntu 24.04 LTS

### Actions Performed
- Backed up existing SSH configuration file:
  - /etc/ssh/sshd_config → sshd_config.backup
- Disabled root login:
  - PermitRootLogin no
- Disabled password authentication:
  - PasswordAuthentication no
- Enabled public key authentication:
  - PubkeyAuthentication yes
- Disabled challenge-response authentication:
  - ChallengeResponseAuthentication no
- Restricted SSH access to specific user:
  - AllowUsers deepika

### Configuration Approach
- Added security settings at the end of sshd_config to override default values
- Restarted SSH service:
  - sudo systemctl restart ssh

### Verification
- Successful login using SSH key:
  - ssh -i ~/.ssh/secure_ssh_project_key deepika@<local-server-ip>
- Password login blocked:
  - ssh deepika@<local-server-ip>
  - Result: Permission denied (publickey)

### Security Outcome
- Eliminated password-based authentication (reducing brute-force risk)
- Enforced SSH key-based secure access
- Restricted server access to authorized users only
- Improved overall Linux server security posture