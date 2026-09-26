# DevMohammad-SA's Dotfiles

[![License](https://img.shields.io/badge/License-MIT-F59E0B?style=flat-square&logo=opensourceinitiative&logoColor=white)](./LICENSE)
[![Stars](https://img.shields.io/github/stars/DevMohammad-SA/dotfiles?style=flat-square&logo=github&logoColor=white&label=Stars&color=EAB308)](https://github.com/DevMohammad-SA/dotfiles/stargazers)

A curated collection of configuration files for my personal development environment. These dotfiles are designed for a modern Linux/macOS setup with a focus on productivity and aesthetics.

## Preview
<img width="1920" height="1080" alt="Screenshot_20260210_233438" src="https://github.com/user-attachments/assets/b6471011-a7aa-497d-b2f4-826feb49c2bd" />
<img width="1920" height="1080" alt="Screenshot_20260210_233349" src="https://github.com/user-attachments/assets/34bb7372-3f39-4418-a4a7-cdf4f58c0a88" />
<img width="1431" height="763" alt="Screenshot_20260210_233450" src="https://github.com/user-attachments/assets/33252d77-f103-41c0-b7e7-017ac4d4da26" />

## Quick Start

```bash
git clone https://github.com/DevMohammad-SA/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow */
```

## What's Included

### Terminal & Shell
- **Alacritty** - GPU-accelerated terminal emulator
- **Ghostty** - Fast, feature-rich terminal emulator
- **Kitty** - GPU-accelerated terminal emulator
- **Bash** - Lightweight, fast shell (used as the server fallback shell)
- **Zsh** - Extended shell with zsh-autosuggestions & zsh-syntax-highlighting (no Oh My Zsh)
- **Tmux** - Terminal multiplexer for session management

### Editors
- **Neovim** - Modern Vim-based editor with LazyVim configuration
- **Vim** - Fallback editor for servers; see [vim-setup.md](./vim-setup.md) for installation

### Windows Manager / Status Bar
- **Window Manager**: Sway configuration for efficient tiling layout
- **Status Bar**: Waybar with custom styling and system information
- **Launcher**: Wofi, plus power menu, window switcher and clipboard history scripts
- **Notifications**: Mako, with a do-not-disturb mode toggled from Waybar
- **Lock Screen**: Swaylock with a blurred screenshot background (works with plain swaylock or swaylock-effects)

## Structure

```
dotfiles/
├── alacritty/      # Terminal emulator configuration
├── bash/           # Bash shell configuration
├── ghostty/        # Alternative terminal emulator
├── kitty/          # Kitty terminal emulator
├── mako/           # Notification daemon
├── nvim/           # Neovim configuration with LazyVim
├── sway/           # Sway window manager
├── swaylock/       # Lock screen theme + lock.sh
├── tmux/           # Terminal multiplexer
├── vimrc/          # Classic Vim configuration
├── waybar/         # Status bar configuration for Sway
├── wofi/           # Launcher + helper scripts (power menu, windows, clipboard)
└── zsh/            # Zsh shell configuration
```

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/DevMohammad-SA/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Stow all packages**
   ```bash
   stow */
   ```
   Or stow individual packages:
   ```bash
   stow alacritty bash ghostty kitty mako nvim sway swaylock tmux vimrc waybar wofi zsh
   ```

## Features

- **Modern Development Environment**: Optimized for coding with syntax highlighting, autocompletion, and LSP support
- **Multiple Themes**: Includes Catppuccin Mocha, Tokyo Night, Moonfly, Gruvbox, Cyberdream, Aura, Ayu Dark, and Chicago95 themes
- **Aesthetic UI**: Carefully chosen themes and color schemes for a pleasant visual experience
- **Dual Shell Support**: Fully configured Bash and Zsh environments, each with a custom prompt
- **Productivity Tools**: Terminal multiplexing with tmux, efficient shell environments
- **Cross-terminal Support**: Configurations for both Alacritty and Ghostty terminal emulators
- **Easy Installation**: One-command setup with GNU Stow

## Requirements

### Essential
- Linux or macOS
- Git
- GNU Stow
- Bash or Zsh (shell)
- Neovim (>= 0.8.0)

### Optional
- Tmux (terminal multiplexer)
- Alacritty or Ghostty (terminal emulator)
- [bash-completion](https://github.com/scop/bash-completion) (enhanced Bash tab completion)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) & [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [TPM](https://github.com/tmux-plugins/tpm) (tmux plugin manager)
- JetBrains Mono Nerd Font (recommended font)

### Sway desktop (Arch / CachyOS)

The Sway, Waybar, Wofi, Mako and Swaylock configs are shared by two machines:
a desktop (CachyOS, AMD GPU) and a ThinkPad T470 (Arch, dual battery). Everything
below is in the official repos (plus the CachyOS repo for `swaylock-effects`):

```bash
sudo pacman -S --needed sway waybar wofi mako libnotify jq ttf-jetbrains-mono-nerd \
    alacritty btop networkmanager nm-connection-editor pavucontrol libpulse playerctl \
    bluez bluez-utils power-profiles-daemon wl-clipboard cliphist grim imagemagick \
    brightnessctl swaylock
```

| Package | Used by |
| --- | --- |
| `sway`, `waybar`, `wofi`, `mako` | The desktop itself |
| `ttf-jetbrains-mono-nerd` | Bar, launcher, notification and lock screen icons/font |
| `jq` | Waybar keyboard-layout module, Wofi window switcher |
| `libnotify` (`notify-send`) | Error notices from the lock and clipboard scripts |
| `alacritty`, `btop` | Clicking CPU / temperature / memory / GPU in Waybar opens btop |
| `networkmanager`, `nm-connection-editor` | Network module: click opens `nmtui`, right click opens the editor |
| `pavucontrol`, `libpulse` (`pactl`) | Volume module: click opens pavucontrol, right/middle click mutes output/mic |
| `playerctl` | Media module scroll-to-skip and the media keys |
| `bluez`, `bluez-utils` (`bluetoothctl`) | Bluetooth module (hidden on machines without an adapter) |
| `power-profiles-daemon` | Power profile module (click cycles saver / balanced / performance) |
| `wl-clipboard`, `cliphist` | Clipboard history (`$mod+Shift+v`); the watcher is a no-op until cliphist is installed |
| `swaylock` **or** `swaylock-effects` | Lock screen (`$mod+Shift+x`, power menu). Effects adds blur, clock and fade-in; it is in the CachyOS repo, and on Arch comes from the AUR (`paru -S swaylock-effects`) |
| `grim`, `imagemagick` | Blurred lock screen background with plain swaylock |
| `brightnessctl` | Brightness keys on the T470 (the Waybar backlight module scrolls via logind and doesn't need it) |

Hardware notes:
- The GPU module reads the `amdgpu` busy counter, so it only shows on the desktop.
- The temperature module reads Intel `coretemp` (`/sys/devices/platform/coretemp.0`), which both machines have.
- Battery, backlight and the per-battery (`int · ext`) readout only show on the T470; the split readout hides while the external battery is removed.

## Themes

The repository includes multiple color schemes:
- **Catppuccin Mocha** - Soothing pastel theme
- **Tokyo Night** - Clean, elegant dark theme (default)
- **Moonfly** - Minimalist dark theme
- **Gruvbox** - Retro groove color scheme
- **Cyberdream** - Futuristic theme
- **Aura**, **Ayu Dark**, **Chicago95** - Additional Alacritty themes

To switch themes, edit the import line in `alacritty/.config/alacritty/alacritty.toml`.

## 🔧 Customization

Feel free to fork this repository and modify the configurations to suit your needs. Each configuration directory contains settings that can be independently customized.

## License

MIT License - see the [LICENSE](LICENSE) file for details.
