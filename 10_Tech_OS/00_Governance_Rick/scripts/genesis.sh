#!/bin/bash
# 🧪 GENESIS PROTOCOL (The Sovereign Kernel)
# Author: Rick Supreme (via Antigravity)
# Target: A0 Amadeus - Layer 0 Bedrock

echo "--- 🧪 STARTING GENESIS PROTOCOL ---"
date

# 1. CORE INFRASTRUCTURE
echo "📦 Installing Process Manager (pm2) & PNPM..."
npm install -g pnpm pm2 @google/openclaw

# 2. CORE IDENTITY
echo "⚙️  Configuring Identity..."
mkdir -p ~/.config/openclaw
cp /root/aspace_a0_amadeus/00_Amadeus/03_OpenClaw_Body/openclaw.json ~/.config/openclaw/openclaw.json

# 3. KERNEL PERSISTENCE
echo "🧠 Instantiating Amadeus Kernel..."
pm2 start "openclaw gateway" --name amadeus-kernel
pm2 save
pm2 startup | tail -n 1 | bash

# 4. ACTIVE DEFENSE (Yaz)
echo "🛡️  Activating Sentinel (Yaz)..."
chmod +x /root/aspace_a0_amadeus/10_Tech_OS/00_Governance_Rick/scripts/yaz_protocol.sh
(crontab -l 2>/dev/null; echo "0 */6 * * * /root/aspace_a0_amadeus/10_Tech_OS/00_Governance_Rick/scripts/yaz_protocol.sh") | crontab -

echo "--- 🧪 GENESIS COMPLETE ---"
echo "Status: A0 Amadeus Kernel is now ACTIVE and PERSISTENT."
pm2 list
