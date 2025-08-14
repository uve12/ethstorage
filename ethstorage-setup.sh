#!/bin/bash
set -e

echo "⚡ EthStorage Trusted Setup Ceremony Installer"
echo "📅 Ceremony: Aug 13 – 22, 2025"
echo "Script by Crypto Console"
sleep 5

# --- Update system ---
echo "📦 Updating system packages..."
sudo apt-get update && sudo apt-get upgrade -y

# --- Install dependencies ---
echo "📥 Installing dependencies..."
sudo apt install -y curl screen iptables build-essential git wget lz4 jq make gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip ca-certificates

# --- Install NVM ---
if ! command -v nvm &> /dev/null; then
    echo "🛠 Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    source ~/.bashrc
else
    echo "✅ NVM already installed"
fi

# --- Install Node.js 18 ---
echo "🛠 Installing Node.js 18..."
source ~/.bashrc
nvm install 18
nvm use 18

# --- Setup ceremony directory ---
CEREMONY_DIR=~/ceremonyeth
mkdir -p $CEREMONY_DIR && cd $CEREMONY_DIR

# --- Install CLI ---
echo "📦 Installing phase2cli..."
npm install -g @p0tion/phase2cli

# --- Authenticate GitHub ---
echo "🔐 Starting GitHub authentication..."
phase2cli auth
echo "👉 Visit https://github.com/login/device, enter the code, and authorize ethstorage."
echo ""
read -p "✅ Have you completed the login and authorization? (yes/no): " CONFIRM
if [[ "$CONFIRM" != "yes" ]]; then
    echo "❌ Authentication not confirmed. Exiting..."
    exit 1
fi

# --- Start ceremony in screen session ---
echo "🚀 Starting ceremony..."
screen -S ceremony bash -c "phase2cli contribute -c ethstorage-v1-trusted-setup-ceremony; exec bash"

echo ""
echo "✅ All set! Use 'screen -r ceremony' to check progress."
