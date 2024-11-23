#!/usr/bin/env bash

# Script to install GitHub CLI (gh) on Ubuntu/Debian-based systems

echo -e "Installing GitHub CLI..."

# Step 1: Add GitHub CLI keyring
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg

# Step 2: Set permissions for the keyring
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg

# Step 3: Add GitHub CLI repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | su>

# Step 4: Update the package list
sudo apt update

# Step 5: Install GitHub CLI
sudo apt install -y gh

# Step 6: Verify installation
if command -v gh &> /dev/null; then
    echo -e "\nGitHub CLI installation complete! Version:"
    gh --version
else
    echo -e "\nGitHub CLI installation failed."
fi

