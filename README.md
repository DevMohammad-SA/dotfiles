# DevMohammad-SA's Dotfiles

A curated collection of configuration files for my personal development environment. These dotfiles are designed for a modern Linux setup with a focus on productivity and aesthetics.

## What's Included

### Window Manager & Desktop Environment
- **Hyprland** - Modern Wayland compositor with smooth animations
- **Waybar** - Highly customizable status bar for Wayland

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
├── alacritty/      # Terminal emulator configuration
├── ghostty/        # Alternative terminal emulator config
├── hyprland/       # Wayland compositor settings
├── nvim/           # Neovim configuration with LazyVim
├── tmux/           # Terminal multiplexer settings
├── vimrc/          # Classic Vim configuration
├── waybar/         # Status bar configuration
└── zsh/            # Shell configuration and themes
```

## Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/DevMohammad-SA/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Backup your existing configs** (recommended)
   ```bash
   # Example for backing up existing configs
   cp ~/.config/nvim ~/.config/nvim.backup
   cp ~/.zshrc ~/.zshrc.backup
   ```

3. **Create symbolic links**
   ```bash
   # Example symlinks - adjust paths as needed
   ln -sf ~/.dotfiles/nvim/.config/nvim ~/.config/nvim
   ln -sf ~/.dotfiles/alacritty ~/.config/alacritty
   ln -sf ~/.dotfiles/hyprland ~/.config/hypr
   ln -sf ~/.dotfiles/waybar ~/.config/waybar
   ```

## Features

- **Modern Development Environment**: Optimized for coding with syntax highlighting, autocompletion, and LSP support
- **Aesthetic UI**: Carefully chosen themes and color schemes for a pleasant visual experience
- **Productivity Tools**: Terminal multiplexing, efficient window management, and customized shell environment
- **Cross-terminal Support**: Configurations for multiple terminal emulators
- **Wayland Native**: Fully compatible with modern Wayland display server

## Requirements

- Linux distribution with Wayland support
- Neovim (>= 0.8.0)
- Tmux
- Zsh
- Alacritty or Ghostty
- Hyprland (for window management)

## Customization

Feel free to fork this repository and modify the configurations to suit your needs. Each configuration directory contains settings that can be independently customized.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

While these are personal dotfiles, suggestions and improvements are welcome! Feel free to open an issue or submit a pull request.

---

**Note**: These configurations are tailored for my personal workflow. Please review and test configurations before applying them to your system.
