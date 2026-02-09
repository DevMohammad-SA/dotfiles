# Changelog

All notable changes to this dotfiles repository will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
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
