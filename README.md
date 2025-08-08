# Nabados Linux

**Nabados** is a modern, developer-focused Linux distribution built for speed, simplicity, and productivity.  
It offers **pre-configured development environments** right from installation using a custom **Calamares** installer.

---

## Features

- 🖥 **Clean & Fast** – Optimized desktop with minimal resource usage.
- 🌍 **Somali Localization** – Full Somali language and keyboard support.
- ⚡ **One-Click Dev Setup** – Install complete development environments in minutes.
- 📦 **Customizable Installation** – Choose your tools and stacks before first boot.
- 🎨 **Custom Branding** – Includes the *Rooni* Somali font and Nabados icon set.

---

## Choose Your Specialization

During installation, Nabados lets you **pick your preferred development environment(s)**:

- **Frontend Development**  
  Node.js, npm, React, TailwindCSS, Vite, browsers, and design tools.
  
- **Backend Development**  
  Go, Python, PostgreSQL, Docker, Gin, GORM, and related server tools.
  
- **Full Stack Development**  
  Complete frontend + backend setup ready to use.
  
- **Blockchain Development**  
  Solidity, Hardhat, Foundry, Web3.js, Ganache, Truffle, local Ethereum node.
  
- **Machine Learning / AI**  
  NumPy, pandas, scikit-learn, PyTorch, TensorFlow, JupyterLab.
  
- **Mobile App Development**  
  Flutter, Dart, Android SDK, Gradle, and emulator tools.
  
- **Cybersecurity & Red Teaming**  
  Metasploit, Burp Suite, Nmap, Wireshark, and offensive security toolkits.

You can select **one or multiple** specializations — Nabados will install and configure everything automatically.

---

## Installation

### 1. Download the ISO
Go to the [Releases](../../releases) page and download the latest Nabados ISO.

### 2. Create a Bootable USB
Use:
- [Rufus](https://rufus.ie) (Windows)
- [Balena Etcher](https://etcher.io) (Windows, macOS, Linux)
- Or `dd` in Linux:
```bash
sudo dd if=Nabados-x.y.iso of=/dev/sdX bs=4M status=progress
````

### 3. Boot into Live Session

* Plug in the USB and boot from it.
* Select **Nabados Live** from the boot menu.

### 4. Launch the Installer

* Open **Nabados Installer** (Calamares) from the desktop.
* Follow the steps:

  * Language & Locale
  * Keyboard Layout
  * Partitioning
  * **Choose Your Specialization** (select dev environments)
  * User Setup
  * Install

### 5. Reboot

* Remove the USB and enjoy your customized Nabados setup.

---

## Download

Latest stable ISOs: [Releases](../../releases)

---

## Contributing

We welcome contributions to Nabados:

* Suggest features via [Issues](../../issues)
* Submit pull requests for improvements

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).
