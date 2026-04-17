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