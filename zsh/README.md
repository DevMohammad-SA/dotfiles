# Zsh Configuration

Zsh shell configuration with Oh My Zsh framework, custom theme, and productivity plugins.

## Features

- **Oh My Zsh**: Popular Zsh configuration framework
- **Custom Theme**: Custom prompt theme
- **Auto-completion**: Intelligent command completion
- **Syntax Highlighting**: Real-time command syntax highlighting
- **Auto-suggestions**: Fish-like autosuggestions based on history
- **History Management**: Command history with timestamps
- **Useful Aliases**: Quick shortcuts for common commands

## Plugins

The configuration includes the following Oh My Zsh plugins:

- **colorize** - Syntax highlighting for cat command
- **git** - Git aliases and functions
- **zsh-autosuggestions** - Fish-like autosuggestions
- **zsh-syntax-highlighting** - Command syntax highlighting
- **zsh-completions** - Additional completion definitions
- **fzf** - Fuzzy finder integration
- **extract** - Universal archive extractor
- **docker** - Docker command completion
- **npm** - npm command completion
- **kubectl** - Kubernetes command completion
- **history-substring-search** - Search history with up/down arrows
- **colored-man-pages** - Colorized man pages

## Aliases

Quick shortcuts defined in `.zshrc`:

```bash
alias vtop="vtop --theme catppuccin-mocha-blue"
alias ezaf="eza --oneline --reverse --sort=size -lah --long --git --tree --level=2"
alias ls1="ls -1"
alias py="python"
alias py3="python3"
alias update="sudo pacman -Syu"              # Update system (Arch Linux)
alias autoremove="sudo pacman -Rns $(pacman -Qtdq)"  # Remove orphaned packages
```

## Installation

1. Install Oh My Zsh:
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

2. Install custom plugins:
   ```bash
   # zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   
   # zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   
   # zsh-completions
   git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
   ```

3. Link the configuration:
   ```bash
   ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
   ```

4. Reload the shell:
   ```bash
   source ~/.zshrc
   ```

## Customization

### Theme
The configuration uses a custom theme (`ZSH_THEME="custom"`). Make sure the custom theme is available in your Oh My Zsh themes directory.

### Editor
- **SSH sessions**: Defaults to `vim`
- **Local sessions**: Defaults to `nvim`

### History
- History size: 50 commands
- Timestamp format: dd-mm-yyyy
- History file: `~/.zsh_history`

### Local Overrides
Create `~/.zshrc.local` for machine-specific configurations that won't be tracked in git:
```bash
# ~/.zshrc.local
export MY_CUSTOM_VAR="value"
alias my_alias="command"
```

## Requirements

- Zsh shell
- Oh My Zsh
- Custom plugins (see Installation section)
- Optional: Homebrew (for macOS/Linux)
- Optional: eza, fzf, vtop (for enhanced commands)

## Notes

- The configuration references `~/.scripts/motd.sh` - create this file if you want a custom MOTD
- Homebrew is configured for Linux: `/home/linuxbrew/.linuxbrew/bin/brew`
- Some aliases are specific to Arch Linux package manager (pacman)
