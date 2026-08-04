# Vim Setup Guide

## Installation

1. **Clone Vundle** (one-time setup):

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

1. **Symlink .vimrc** (assuming you stow the dotfiles):

```bash
ln -s ~/dotfiles/vimrc/.vimrc ~/.vimrc
```

Or if you're using GNU Stow:

```bash
stow vimrc
```

1. **Install all plugins** (inside vim):
:PluginInstall
Then restart vim.

## Requirements

For full functionality, install these on your server:

```bash
# Debian/Ubuntu
sudo apt-get install vim python3-pip exuberant-ctags

# Install Python linters/formatters
pip3 install flake8 black
```

## Troubleshooting

- **Colorscheme not loading?** Check vim version is 8.0+: `vim --version`
- **Jedi not working?** Install: `pip3 install jedi`
- **ALE linters not found?** Make sure flake8 and black are in PATH: `which flake8 black`
- **NERDTree won't open?** Check stow symlink: `ls -la ~/.vimrc`

## Notes

- This vim config is for servers/fallback. Use Neovim on main machine.
- Vundle requires git to clone plugins.
- On older Debian, you may need to use `vim-gnome` or `vim-gtk` for clipboard support.
