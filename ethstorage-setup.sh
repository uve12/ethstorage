#!/bin/bash
set -e

echo "⚡ EthStorage Trusted Setup Ceremony Installer"
echo "📅 Ceremony: Aug 13 – 22, 2025"
echo "Script by Crypto Console"
sleep 3

# --- Update system ---
echo "📦 Updating system packages..."
sudo apt-get update -qq && sudo apt-get upgrade -y -qq

# --- Install dependencies ---
echo "📥 Installing dependencies..."
sudo apt install -y -qq curl screen iptables build-essential git wget lz4 jq make gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip ca-certificates

# --- Install or load NVM silently ---
export NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
    echo "🛠 Installing NVM..."
    curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash >/dev/null 2>&1
else
    echo "🔄 Updating NVM..."
    cd "$NVM_DIR" && git pull >/dev/null 2>&1 && cd -
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- Install Node.js 18 ---
echo "🛠 Installing Node.js 18..."
nvm install 18 >/dev/null 2>&1
nvm use 18 >/dev/null 2>&1

# --- Update npm to latest v10.x (compatible with Node 18) ---
echo "📦 Updating npm to latest v10.x..."
npm install -g npm@10 >/dev/null 2>&1

# --- Setup ceremony directory ---
CEREMONY_DIR=~/ceremonyeth
mkdir -p $CEREMONY_DIR && cd $CEREMONY_DIR

# --- Install CLI ---
echo "📦 Installing phase2cli..."
npm install -g @p0tion/phase2cli >/dev/null 2>&1

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
