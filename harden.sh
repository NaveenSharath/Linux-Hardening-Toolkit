#!/bin/bash

echo "🔐 Linux Hardening Toolkit - Started"
echo "------------------------------------"

# 1. Update and upgrade system
echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

# 2. Disable guest login (for lightdm)
if [ -f /etc/lightdm/lightdm.conf ]; then
    echo "[+] Disabling guest login..."
    sudo sed -i '/^\[Seat:\*\]/a allow-guest=false' /etc/lightdm/lightdm.conf
else
    echo "[-] lightdm not found, skipping guest login disable."
fi

# 3. Set password complexity
echo "[+] Enforcing strong password policy..."
sudo apt install libpam-pwquality -y
sudo sed -i 's/^#.minlen./minlen = 12/' /etc/security/pwquality.conf
sudo sed -i 's/^#.dcredit./dcredit = -1/' /etc/security/pwquality.conf
sudo sed -i 's/^#.ucredit./ucredit = -1/' /etc/security/pwquality.conf
sudo sed -i 's/^#.ocredit./ocredit = -1/' /etc/security/pwquality.conf
sudo sed -i 's/^#.lcredit./lcredit = -1/' /etc/security/pwquality.conf

# 4. Disable root login over SSH
echo "[+] Disabling root SSH login..."
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

echo "✅ Hardening Complete!"
