# ⚡ EthStorage V1 Trusted Setup Ceremony – Quick Guide

**📅 Dates:** **August 13 – 22, 2025**

This ceremony secures **EthStorage’s zk-SNARK circuits** for proof-of-storage, ensuring data integrity and decentralization.

---


# Join Crypto Console Community

Join TG : [Crypto Console Telegram](https://t.me/cryptoconsol) 

Follow X : [Crypto Console Twitter](https://www.x.com/cryptoconsol) 

Subscribe : [Crypto Console Youtube](https://www.youtube.com/@cryptoconsole)

---

# VPS Options

💻 Contabo VPS Deals 🚀 Buy with Credit Card/Paypal/Crypto Credit card : 

Get powerful VPS solutions with these direct links:  

VPS 4C : [contabo VPS 4C](https://www.kqzyfj.com/click-101278318-13796470)

VPS 6C : [Contabo VPS 6C](https://www.kqzyfj.com/click-101278318-13796472)

VPS 8C : [Contabo VPS 8C](https://www.jdoqocy.com/click-101278318-13796474)

VPS 10C : [Contabo VPS 10C](https://www.anrdoezrs.net/click-101278318-13796476)

VPS 14C : [contabo VPS 14C](https://www.kqzyfj.com/click-101278318-15807107)

---

## ✅ Requirements

- **💻 OS:** Linux/Windows/Mac
- **🔑 GitHub:**
  - Account **≥ 1 month** old  
  - **1+ public repo**  
  - Follow **≥ 5 accounts** & have **≥ 1 follower**  
  - Allow **Read & Write** access to GitHub Gists  
- **🌐 Internet:** Stable connection (you may wait in queue for hours)

---

## How to Run
```
curl -O https://raw.githubusercontent.com/uve12/ethstorage/main/ethstorage-setup.sh
chmod +x ethstorage-setup.sh
./ethstorage-setup.sh
```

### Features of This Script

📦 Installs all dependencies automatically

🛠 Installs NVM & Node.js 18 if missing

📂 Creates ceremony directory

🔐 Starts GitHub authentication

🚀 Launches ceremony inside a screen session so it continues if terminal closes

---

### Github Authentication 

- Visit https://github.com/login/device, enter the code, and authorize ethstorage.

---

## 🧭 Option 2 – Manual Setup (Step-by-Step)

> Works on Ubuntu/Linux, macOS, or WSL. For VPS, prefer **Ubuntu 20.04/22.04+**.

### 1) Update system & install packages

```bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install -y curl screen iptables build-essential git wget lz4 jq make gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip ca-certificates
```

### 2) Install NVM (Node Version Manager)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
```

### 3) Install Node.js 18

```bash
nvm install 18
nvm use 18
```

> Keep npm on **v10.x** for Node 18 compatibility:

```bash
npm install -g npm@10
```

### 4) Create the working folder

```bash
mkdir -p ~/ceremonyeth && cd ~/ceremonyeth
```

### 5) Install the ceremony CLI

```bash
npm install -g @p0tion/phase2cli
```

### 6) Authenticate with GitHub

```bash
phase2cli auth
```

* Visit **[https://github.com/login/device](https://github.com/login/device)**
* Enter the code from your terminal
* Click **Authorize ethstorage**
* Allow **Read & Write access to GitHub Gists** in permissions

(optional) Verify authentication:

```bash
phase2cli whoami
```

### 7) Start a `screen` session

```bash
screen -S ceremony
```

### 8) Join the ceremony

```bash
phase2cli contribute -c ethstorage-v1-trusted-setup-ceremony
```

* Press **Enter** for random input, or type your own characters.

---

## 🧹 Cleanup & Logout

When done, it’s recommended to clean up for security:

```bash
phase2cli clean
phase2cli logout
rm -rf ~/ceremonyeth
```

---

🖥 Screen Commands

| Action         | Command                       |
| -------------- | ------------------------------|
| Detach         | `Ctrl + A + D`                |
| Resume         | `screen -r ceremony`          |
| Delete screen  | `screen -XS ceremony quit`    |
| List sessions  | `screen -ls`                  |

---

## 🛠 Troubleshooting

**npm update error (`EBADENGINE`)**
You’re on Node 18 — stick to `npm@10`:

```bash
npm install -g npm@10
```

**Lost connection?**
Just re-run:

```bash
phase2cli contribute -c ethstorage-v1-trusted-setup-ceremony
```

It will resume from where you left off.


---

🎉 **You’ve successfully contributed to EthStorage’s decentralization!**

---

Follow : https://x.com/cryptoconsol for more tech contents.


