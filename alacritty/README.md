# Alacritty Configuration

This directory contains the Alacritty terminal emulator configuration along with multiple color themes.

## Files

- `alacritty.toml` - Main configuration file
- `catppuccin-mocha.toml` - Catppuccin Mocha theme
- `tokyo-night.toml` - Tokyo Night theme (default)
- `moonfly-default.toml` - Moonfly theme
- `gruvbox-dark-soft-contrast.toml` - Gruvbox theme
- `cyberdream.toml` - Cyberdream theme

## Theme Selection

To change the theme, edit the `general.import` section in `alacritty.toml`:

```toml
general.import = [
  "~/.dotfiles/alacritty/tokyo-night.toml",  # Change this line
]
```

Available themes:
- `~/dotfiles/alacritty/catppuccin-mocha.toml`
- `~/dotfiles/alacritty/tokyo-night.toml`
- `~/dotfiles/alacritty/moonfly-default.toml`
- `~/dotfiles/alacritty/gruvbox-dark-soft-contrast.toml`
- `~/dotfiles/alacritty/cyberdream.toml`

**Note**: Update the path to match where you cloned your dotfiles (e.g., `~/.dotfiles` or `~/dotfiles`).

## Key Features

- **Font**: JetBrainsMono Nerd Font Bold, 13pt
- **Cursor**: Block style with blinking enabled
- **Shell**: Zsh
- **Keybinding**: `Ctrl + ` ` toggles fullscreen

## Customization

You can customize the following in `alacritty.toml`:
- Font family and size
- Cursor style (Block, Beam, Underline)
- Window padding
- Opacity and blur (currently commented out)
- Custom keybindings

## Requirements

- Alacritty terminal emulator
- JetBrainsMono Nerd Font (or change the font family in config)
