# Linux Hardening Toolkit
This project contains scripts and configurations to harden a Linux system for improved security.
# Linux Hardening Toolkit 🛡

This project provides a simple script (harden.sh) to harden a Linux system by:
- Disabling unused services
- Applying basic firewall rules
- Updating software packages
- Enforcing strong password policies
- Setting secure file permissions

## 📁 Structure
- harden.sh — Main automation script for applying hardening settings.
- README.md — Project documentation.

## 🧠 Why this matters in Cybersecurity

In real-world cybersecurity, system hardening is one of the *first defenses* against attackers. Many successful hacks happen on systems that:
- Are outdated
- Have weak settings
- Are running unused services

This project helps *prevent those weaknesses* by automating basic protections.

## 🚀 How to use

```bash
chmod +x harden.sh
sudo ./harden.sh
