#!/usr/bin/env bash

# Dotfiles Installation Script
# This script creates symbolic links from the dotfiles directory to your home directory

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where the script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  Dotfiles Installation Script  ${NC}"
echo -e "${BLUE}================================${NC}"
echo ""
echo -e "Dotfiles directory: ${GREEN}$DOTFILES_DIR${NC}"
echo -e "Backup directory: ${GREEN}$BACKUP_DIR${NC}"
echo ""

# Function to print colored output
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}→${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Function to backup existing files
backup_if_exists() {
    local file=$1
    if [ -e "$file" ] || [ -L "$file" ]; then
        mkdir -p "$BACKUP_DIR"
        print_warning "Backing up existing $file to $BACKUP_DIR"
        mv "$file" "$BACKUP_DIR/"
        return 0
    fi
    return 1
}

# Function to create symlink
create_symlink() {
    local source=$1
    local target=$2
    
    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # Backup existing file/link if it exists
    backup_if_exists "$target"
    
    # Create the symlink
    ln -sf "$source" "$target"
    
    if [ $? -eq 0 ]; then
        print_success "Linked $target"
    else
        print_error "Failed to link $target"
    fi
}

echo -e "${BLUE}Step 1: Creating symbolic links${NC}"
echo ""

# Neovim
if [ -d "$DOTFILES_DIR/nvim/.config/nvim" ]; then
    print_info "Setting up Neovim..."
    create_symlink "$DOTFILES_DIR/nvim/.config/nvim" "$HOME/.config/nvim"
fi

# Alacritty
if [ -d "$DOTFILES_DIR/alacritty/.config/alacritty" ]; then
    print_info "Setting up Alacritty..."
    create_symlink "$DOTFILES_DIR/alacritty/.config/alacritty" "$HOME/.config/alacritty"
fi

# Ghostty
if [ -d "$DOTFILES_DIR/ghostty" ]; then
    print_info "Setting up Ghostty..."
    create_symlink "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"
fi

# Tmux
if [ -f "$DOTFILES_DIR/tmux/.tmux.conf" ]; then
    print_info "Setting up Tmux..."
    create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
fi

# Zsh
if [ -f "$DOTFILES_DIR/zsh/.zshrc" ]; then
    print_info "Setting up Zsh..."
    create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
fi

# Vim
if [ -f "$DOTFILES_DIR/vimrc/.vimrc" ]; then
    print_info "Setting up Vim..."
    create_symlink "$DOTFILES_DIR/vimrc/.vimrc" "$HOME/.vimrc"
fi

echo ""
echo -e "${BLUE}Step 2: Post-installation setup${NC}"
echo ""

# Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_warning "Oh My Zsh is not installed"
    echo -e "  Install with: ${YELLOW}sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"${NC}"
fi

# Check if Tmux Plugin Manager is installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    print_warning "Tmux Plugin Manager (TPM) is not installed"
    echo -e "  Install with: ${YELLOW}git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm${NC}"
    echo -e "  Then in tmux, press: ${YELLOW}prefix + I${NC} (capital i) to install plugins"
fi

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    print_warning "Neovim is not installed"
    echo -e "  Install Neovim from: ${YELLOW}https://neovim.io/${NC}"
fi

echo ""
echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}  Installation Complete! 🎉${NC}"
echo -e "${GREEN}================================${NC}"
echo ""

if [ -d "$BACKUP_DIR" ]; then
    echo -e "Your old configurations have been backed up to:"
    echo -e "${YELLOW}$BACKUP_DIR${NC}"
    echo ""
fi

echo -e "Next steps:"
echo -e "  1. Restart your terminal or run: ${YELLOW}source ~/.zshrc${NC}"
echo -e "  2. Install missing dependencies (see warnings above)"
echo -e "  3. For Neovim: open nvim and let plugins install automatically"
echo -e "  4. For Tmux: open tmux and press ${YELLOW}prefix + I${NC} to install plugins"
echo ""
echo -e "Enjoy your new dotfiles! ✨"
