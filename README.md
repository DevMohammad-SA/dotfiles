# DevMohammad-SA's Dotfiles

[![License](https://img.shields.io/badge/License-MIT-F59E0B?style=flat-square&logo=opensourceinitiative&logoColor=white)](./LICENSE)
[![Stars](https://img.shields.io/github/stars/DevMohammad-SA/Twibble?style=flat-square&logo=github&logoColor=white&label=Stars&color=EAB308)](https://github.com/DevMohammad-SA/Twibble/stargazers)

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
- **Bash** - Lightweight, fast shell with ble.sh for syntax highlighting & auto-suggestions
- **Zsh** - Extended shell with custom configurations
- **Tmux** - Terminal multiplexer for session management

### Editors
- **Neovim** - Modern Vim-based editor with LazyVim configuration
- **Vim** - Classic text editor with custom vimrc

## Structure

```
dotfiles/
├── alacritty/      # Terminal emulator configuration with themes
├── bash/           # Bash shell configuration with ble.sh
├── ghostty/        # Alternative terminal emulator config
├── nvim/           # Neovim configuration with LazyVim
├── tmux/           # Terminal multiplexer settings with plugins
├── vimrc/          # Classic Vim configuration
└── zsh/            # Zsh shell configuration and themes
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
   stow alacritty bash ghostty nvim tmux vimrc zsh
   ```

## Features

- **Modern Development Environment**: Optimized for coding with syntax highlighting, autocompletion, and LSP support
- **Multiple Themes**: Includes Catppuccin Mocha, Tokyo Night, Moonfly, Gruvbox, and Cyberdream themes
- **Aesthetic UI**: Carefully chosen themes and color schemes for a pleasant visual experience
- **Dual Shell Support**: Fully configured Bash (with ble.sh) and Zsh (with Oh My Zsh) environments
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
- [ble.sh](https://github.com/akinomyoga/ble.sh) (Bash syntax highlighting & auto-suggestions)
- [bash-completion](https://github.com/scop/bash-completion) (enhanced Bash tab completion)
- [Oh My Zsh](https://ohmyz.sh/) (Zsh configuration framework)
- [TPM](https://github.com/tmux-plugins/tpm) (tmux plugin manager)
- JetBrains Mono Nerd Font (recommended font)

## Themes

The repository includes multiple color schemes:
- **Catppuccin Mocha** - Soothing pastel theme
- **Tokyo Night** - Clean, elegant dark theme (default)
- **Moonfly** - Minimalist dark theme
- **Gruvbox** - Retro groove color scheme
- **Cyberdream** - Futuristic theme

To switch themes, edit the import line in `alacritty/.config/alacritty/alacritty.toml`.

## 🔧 Customization

Feel free to fork this repository and modify the configurations to suit your needs. Each configuration directory contains settings that can be independently customized.

## License

MIT License - see the [LICENSE](LICENSE) file for details.
