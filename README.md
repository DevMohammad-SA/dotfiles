# DevMohammad-SA's Dotfiles

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/DevMohammad-SA/dotfiles?style=social)](https://github.com/DevMohammad-SA/dotfiles)

A curated collection of configuration files for my personal development environment. These dotfiles are designed for a modern Linux/macOS setup with a focus on productivity and aesthetics.

## 📸 Preview

<!-- Add screenshots of your setup here -->
> **Note**: Add screenshots of your terminal setup, themes, and workflow to showcase your configuration!

## ⚡ Quick Start

```bash
# Clone the repository
git clone https://github.com/DevMohammad-SA/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Run the installation script
chmod +x install.sh
./install.sh

# Restart your terminal
```

## 📦 What's Included

### Terminal & Shell
- **Alacritty** - GPU-accelerated terminal emulator
- **Ghostty** - Fast, feature-rich terminal emulator
- **Zsh** - Extended shell with custom configurations
- **Tmux** - Terminal multiplexer for session management

### Editors
- **Neovim** - Modern Vim-based editor with LazyVim configuration
- **Vim** - Classic text editor with custom vimrc

## 📁 Structure

```
dotfiles/
├── alacritty/      # Terminal emulator configuration with themes
├── ghostty/        # Alternative terminal emulator config
├── nvim/           # Neovim configuration with LazyVim
├── tmux/           # Terminal multiplexer settings with plugins
├── vimrc/          # Classic Vim configuration
└── zsh/            # Shell configuration and themes
```

## 🚀 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/DevMohammad-SA/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **(Optional) Backup existing configurations**
   ```bash
   chmod +x backup.sh
   ./backup.sh
   ```

3. **Run the installation script**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```
   
   Or manually create symbolic links:
   ```bash
   # Backup existing configs (recommended)
   mkdir -p ~/.config_backup
   cp -r ~/.config/nvim ~/.config_backup/ 2>/dev/null || true
   cp ~/.zshrc ~/.config_backup/ 2>/dev/null || true
   cp ~/.tmux.conf ~/.config_backup/ 2>/dev/null || true
   
   # Create symbolic links
   ln -sf ~/.dotfiles/nvim/.config/nvim ~/.config/nvim
   ln -sf ~/.dotfiles/alacritty/.config/alacritty ~/.config/alacritty
   ln -sf ~/.dotfiles/ghostty ~/.config/ghostty
   ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
   ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
   ln -sf ~/.dotfiles/vimrc/.vimrc ~/.vimrc
   ```

## ✨ Features

- **Modern Development Environment**: Optimized for coding with syntax highlighting, autocompletion, and LSP support
- **Multiple Themes**: Includes Catppuccin Mocha, Tokyo Night, Moonfly, Gruvbox, and Cyberdream themes
- **Aesthetic UI**: Carefully chosen themes and color schemes for a pleasant visual experience
- **Productivity Tools**: Terminal multiplexing with tmux, efficient shell environment with zsh
- **Cross-terminal Support**: Configurations for both Alacritty and Ghostty terminal emulators
- **Easy Installation**: Automated installation script for quick setup

## 📋 Requirements

### Essential
- Linux or macOS
- Git
- Zsh (shell)
- Neovim (>= 0.8.0)

### Optional
- Tmux (terminal multiplexer)
- Alacritty or Ghostty (terminal emulator)
- [Oh My Zsh](https://ohmyz.sh/) (zsh configuration framework)
- [TPM](https://github.com/tmux-plugins/tpm) (tmux plugin manager)
- JetBrains Mono Nerd Font (recommended font)

## 🎨 Themes

The repository includes multiple color schemes:
- **Catppuccin Mocha** - Soothing pastel theme
- **Tokyo Night** - Clean, elegant dark theme (default)
- **Moonfly** - Minimalist dark theme
- **Gruvbox** - Retro groove color scheme
- **Cyberdream** - Futuristic theme

To switch themes, edit the import line in `alacritty/.config/alacritty/alacritty.toml`.

## 🔧 Customization

Feel free to fork this repository and modify the configurations to suit your needs. Each configuration directory contains settings that can be independently customized.

## 📚 Individual Configuration Docs

- [Neovim Setup](nvim/.config/nvim/README.md) - LazyVim configuration details
- [Tmux Configuration](tmux/README.md) - Plugin setup and keybindings
- [Zsh Configuration](zsh/README.md) - Plugins and customization guide
- [Alacritty Themes](alacritty/README.md) - Theme selection and customization

## 🐛 Troubleshooting

### Fonts not displaying correctly
Install a Nerd Font for proper icon display:
```bash
# On macOS with Homebrew
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

# On Linux (Arch)
yay -S ttf-jetbrains-mono-nerd

# On Linux (Ubuntu/Debian)
# Download from https://www.nerdfonts.com/font-downloads
```

### Tmux plugins not loading
Initialize TPM (Tmux Plugin Manager):
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Then in tmux, press: prefix + I (capital i)
```

### Zsh plugins missing
Install Oh My Zsh and required plugins:
```bash
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Theme not applying in Alacritty
Update the import path in `alacritty/.config/alacritty/alacritty.toml` to match your dotfiles location:
```toml
general.import = [
  "~/.dotfiles/alacritty/tokyo-night.toml",  # Update path as needed
]
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

While these are personal dotfiles, suggestions and improvements are welcome! Feel free to open an issue or submit a pull request.

---

**Note**: These configurations are tailored for my personal workflow. Please review and test configurations before applying them to your system.
