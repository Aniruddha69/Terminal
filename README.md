<h1 align="center">✨ Terminal ✨</h1>

<h3 align="center">A single-liner solution for a wholesome, aesthetic Windows Terminal setup.</h3>

<p align="center">
  <img src="https://img.shields.io/badge/OS-Windows-blue?style=flat-square\&logo=windows" alt="Windows">
  <img src="https://img.shields.io/badge/Shell-PowerShell-blue?style=flat-square\&logo=powershell" alt="PowerShell">
  <img src="https://img.shields.io/badge/Theme-Catppuccin-ABE9B3?style=flat-square" alt="Catppuccin">
</p>

\---

## 🚀 Features

This setup script automates the transformation of your Windows Terminal into a productive and beautiful environment:

* **📦 Automated Installation**: Installs PowerShell 7 and Fastfetch using `winget`.
* **🎨 Catppuccin Mocha Theme**: Pre-configured color scheme for a modern, soft look.
* **✨ Custom Fastfetch**: Includes a unique ASCII art logo and system info layout.
* **⌨️ Enhanced PowerShell Profile**:

  * Custom keybindings (Ctrl+D to delete, Ctrl+Z to undo, etc.).
  * Useful utility functions (`uptime`, `winutil`).
  * Powerful Git shortcuts (`gs`, `ga`, `gcom`, `lazyg`).
  * Integrated `Show-Help` command to see all available shortcuts.
* **🖼️ Aesthetic Terminal Settings**:

  * Acrylic transparency (80% opacity).
  * JetBrainsMono Nerd Font integration.
  * Custom cursor and padding.

## 📋 Requirements

Before running the script, ensure you have:

1. **Windows Terminal** installed.
2. **Winget** (Windows Package Manager) enabled.
3. **JetBrainsMono Nerd Font** installed (or update `settings.json` with your preferred font).

## 🛠️ Usage

1. Run the setup script:

```powershell
   irm https://github.com/Aniruddha69/Terminal/raw/main/setup.ps1 | iex
   ```

2. **Restart Windows Terminal** to see the changes.

## 📂 File Structure

* `setup.ps1`: The main automation script.
* `LICENSE`: MIT License.

## 🛠️ Customization

* **Fastfetch**: Config located at `\~/.config/fastfetch/config.jsonc`.
* **PowerShell Profile**: Located at `\~/Documents/PowerShell/profile.ps1`.
* **Terminal Settings**: Automatically updates `%LOCALAPPDATA%\\Packages\\Microsoft.WindowsTerminal\_8wekyb3d8bbwe\\LocalState\\settings.json`.

\---

<p align="center">Built with 💖 for a better terminal experience.</p>

