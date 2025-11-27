#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$PWD"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

FILES=(.vimrc .zshrc .ideavimrc)

echo "Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

for f in "${FILES[@]}"; do
  src="$REPO_DIR/$f"
  dest="$HOME/$f"
  if [ ! -e "$src" ]; then
    echo "Skipping $f: not found in repo"
    continue
  fi
  if [ -L "$dest" ] && [ "$(readlink -- "$dest")" = "$src" ]; then
    echo "Link for $dest already points to $src; skipping"
    continue
  fi
  if [ -e "$dest" ]; then
    echo "Backing up existing $dest to $BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
  fi
  echo "Creating symlink: $dest -> $src"
  ln -s "$src" "$dest"
done

echo "Done. Backups stored at $BACKUP_DIR"

echo "
Notes:
- Install any recommended plugins manually (vim-plug, fzf, zsh plugins)
- See README.md for more information
"
