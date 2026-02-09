#!/usr/bin/env bash

# Backup Script for Existing Dotfiles
# Run this before installing new dotfiles to preserve your current configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Backup directory with timestamp
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  Dotfiles Backup Script${NC}"
echo -e "${BLUE}================================${NC}"
echo ""
echo -e "Backup directory: ${GREEN}$BACKUP_DIR${NC}"
echo ""

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Function to backup file or directory
backup_item() {
    local source=$1
    local name=$2
    
    if [ -e "$source" ] || [ -L "$source" ]; then
        echo -e "${YELLOW}→${NC} Backing up $name..."
        cp -rL "$source" "$BACKUP_DIR/" 2>/dev/null || cp -r "$source" "$BACKUP_DIR/"
        echo -e "${GREEN}✓${NC} $name backed up"
        return 0
    else
        echo -e "${BLUE}ℹ${NC} $name not found, skipping"
        return 1
    fi
}

# Backup configurations
echo -e "${BLUE}Starting backup...${NC}"
echo ""

backup_item "$HOME/.config/nvim" "Neovim config"
backup_item "$HOME/.config/alacritty" "Alacritty config"
backup_item "$HOME/.config/ghostty" "Ghostty config"
backup_item "$HOME/.tmux.conf" "Tmux config"
backup_item "$HOME/.zshrc" "Zsh config"
backup_item "$HOME/.vimrc" "Vim config"
backup_item "$HOME/.config/hypr" "Hyprland config (if exists)"
backup_item "$HOME/.config/waybar" "Waybar config (if exists)"

# Backup plugin directories
echo ""
echo -e "${BLUE}Backing up plugin directories...${NC}"
backup_item "$HOME/.tmux/plugins" "Tmux plugins"
backup_item "$HOME/.oh-my-zsh/custom" "Oh My Zsh custom"

echo ""
echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}  Backup Complete! ✓${NC}"
echo -e "${GREEN}================================${NC}"
echo ""
echo -e "Your configurations have been backed up to:"
echo -e "${YELLOW}$BACKUP_DIR${NC}"
echo ""
echo -e "You can now safely install the new dotfiles."
echo -e "To restore your backup, simply copy files back from the backup directory."
echo ""
