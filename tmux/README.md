# Tmux Configuration

Tmux configuration with Catppuccin Mocha theme and useful plugins.

## Features

- **Mouse Support**: Enabled for easy navigation
- **256 Color Support**: Full color terminal support
- **Catppuccin Mocha Theme**: Beautiful pastel color scheme
- **Status Bar Modules**: CPU, battery, uptime, session info
- **Plugin Management**: Using TPM (Tmux Plugin Manager)

## Plugins

This configuration uses the following plugins via TPM:

1. **catppuccin/tmux** - Catppuccin theme with custom modules
2. **tmux-plugins/tmux-sensible** - Basic tmux settings everyone can agree on
3. **tmux-plugins/tmux-battery** - Battery status in status bar
4. **tmux-plugins/tmux-cpu** - CPU and RAM usage display

## Installation

1. Install TPM (Tmux Plugin Manager):
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

2. Link the configuration:
   ```bash
   ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
   ```

3. Reload tmux configuration:
   ```bash
   tmux source ~/.tmux.conf
   ```

4. Install plugins:
   - Inside tmux, press `prefix + I` (capital I) to fetch and install plugins
   - `prefix` is typically `Ctrl + b`

## Status Bar Layout

The status bar includes:
- **Left**: Session information
- **Right**: Application → CPU → Session → Uptime → Battery → Hostname

## Key Bindings

Uses default tmux keybindings with:
- `prefix`: `Ctrl + b`
- Mouse support for pane selection and resizing

## Customization

To customize the Catppuccin theme, modify these settings:
```bash
set -g @catppuccin_flavor "mocha"  # Options: latte, frappe, macchiato, mocha
set -g @catppuccin_window_status_style "rounded"
```

## Troubleshooting

**Plugins not loading?**
1. Make sure TPM is installed in `~/.tmux/plugins/tpm`
2. Press `prefix + I` inside tmux to install plugins
3. Reload tmux: `tmux source ~/.tmux.conf`

**Colors not displaying correctly?**
Ensure your terminal supports 256 colors and has `TERM` set correctly.
