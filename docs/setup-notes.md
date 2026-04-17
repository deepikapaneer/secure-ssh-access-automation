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
Secure SSH access by eliminating insecure authentication methods and enforcing key-based authentication.

### Environment
- Server IP: `<local-server-ip>`
- OS: Ubuntu 24.04 LTS

### Actions Performed
- Created a backup of the SSH configuration file:
  - /etc/ssh/sshd_config → sshd_config.backup
- Disabled root login:
  - PermitRootLogin no
- Disabled password-based authentication:
  - PasswordAuthentication no
- Enabled public key authentication:
  - PubkeyAuthentication yes
- Disabled challenge-response authentication:
  - ChallengeResponseAuthentication no
- Restricted SSH access to a specific user:
  - AllowUsers deepika

### Configuration Approach
- Updated sshd_config by adding security settings at the end of the file to override defaults
- Restarted SSH service to apply changes:
  - sudo systemctl restart ssh

### Verification
- Verified successful SSH login using key-based authentication:
  - ssh -i ~/.ssh/secure_ssh_project_key deepika@<local-server-ip>
- Verified password-based login is blocked:
  - ssh deepika@<local-server-ip>
  - Result: Permission denied (publickey)

### Security Outcome
- Eliminated risk of brute-force attacks by disabling password authentication
- Enforced secure SSH key-based access
- Restricted access to authorized users only
- Strengthened overall Linux server security posture

### Notes
- Verified SSH key permissions:
  - ~/.ssh → 700
  - ~/.ssh/authorized_keys → 600
- Maintained an active session during configuration to prevent lockout