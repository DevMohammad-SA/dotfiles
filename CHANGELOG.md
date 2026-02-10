# Changelog

All notable changes to this dotfiles repository will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [1.1.0] - 2026-02-10

### Added
- **Bash shell configuration** (`bash/`) with feature-rich `.bashrc`:
  - [ble.sh](https://github.com/akinomyoga/ble.sh) integration for syntax highlighting and fish-like auto-suggestions
  - Colorized prompt with Git branch display
  - Colored output for `ls`, `grep`, `diff`, `ip`, and man pages
  - Enhanced tab completion (case-insensitive, colored stats, visible stats)
  - `bash-completion` package integration
  - Better history management with deduplication and arrow-key search
  - MOTD script support (`~/.scripts/motd.sh`)
- Bash configuration documentation (`bash/README.md`)
- Bash troubleshooting section in main README
- Bash symlink in manual installation instructions
- Automated installation script (`install.sh`) for easy setup
- MIT License file
- Individual README files for major configurations:
  - Alacritty configuration guide with theme switching instructions
  - Tmux setup guide with plugin management
  - Zsh configuration documentation
- CONTRIBUTING.md with contribution guidelines
- Enhanced main README with:
  - Quick start section
  - Troubleshooting guide
  - Better structured documentation
  - Preview/screenshot placeholder
- Organized `.gitignore` with comments and sections
- This CHANGELOG file

### Changed
- Updated README to include Bash in "What's Included" and directory structure
- Updated requirements: Bash or Zsh (previously Zsh only)
- Added `ble.sh` and `bash-completion` to optional requirements
- Updated features section to reflect dual shell support (Bash + Zsh)
- Added Bash Configuration to Individual Configuration Docs listing
- Updated README to reflect actual repository structure
- Removed references to non-existent hyprland and waybar configurations
- Improved Alacritty theme import paths to be more portable
- Enhanced requirements section with optional dependencies
- Better categorization of features

### Fixed
- Corrected directory structure in README documentation
- Updated installation instructions with backup steps
- Fixed theme paths in Alacritty configuration

## [1.0.0] - Previous State

### Initial Setup
- Alacritty terminal configuration with multiple themes
- Ghostty terminal configuration
- Neovim LazyVim setup
- Tmux configuration with Catppuccin theme
- Zsh with Oh My Zsh and multiple plugins
- Vim configuration

---

## How to Update This File

When making changes to the repository:

1. Add entries under `[Unreleased]` in the appropriate category:
   - **Added** for new features
   - **Changed** for changes in existing functionality
   - **Deprecated** for soon-to-be removed features
   - **Removed** for now removed features
   - **Fixed** for any bug fixes
   - **Security** for vulnerability fixes

2. When releasing a new version, move `[Unreleased]` items to a new version section with date
