# Installation & Setup

This document explains how to install the dotfiles, symlink them into your home directory, and recommended supporting tools and plugins.

## Install

```bash
cd /path/to/dotfiles
./install.sh
```

This script will create a backup directory in your home if the destination files already exist (e.g. `~/.vimrc`), then create symlinks pointing from your home directory to the files inside this repo.

## Recommended Tools & Plugins

- vim-plug for Vim plugins (https://github.com/junegunn/vim-plug)
  - Install: `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim` and then `:PlugInstall` inside Vim

- fzf: fuzzy finder (https://github.com/junegunn/fzf)
  - `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install`

- ripgrep (rg) for fast search
  - `sudo apt install ripgrep`

- zsh plugins
  - `zsh-autosuggestions` and `zsh-syntax-highlighting` are recommended

- starship prompt (optional), also works well with zsh: https://starship.rs

## IdeaVim

If you're using JetBrains IDE with IdeaVim plugin, make sure `.ideavimrc` is placed at `~/.ideavimrc` or configured as the IDE reads it.

## Uninstall / Rollback

The `install.sh` script moves existing dotfiles into a backup directory, so you can restore them from that backup if needed.

## Customization

- Add machine-specific overrides into `~/.zshrc.local` if you want private settings.

Enjoy!
