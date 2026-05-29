#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

declare -A FILES_TO_LINK=(
  ["nvim"]="$HOME/.config/nvim"
  ["tmux/.tmux.conf"]="$HOME/.tmux.conf"
  ["zsh/.zshrc"]="$HOME/.zshrc"
  ["hypr"]="$HOME/.config/hypr"
  ["delta-shell"]="$HOME/.config/delta-shell"
)

echo "Linking dotfiles..."

for repo_path in "${!FILES_TO_LINK[@]}"; do
  source_file="$DOTFILES_DIR/$repo_path"
  target_file="${FILES_TO_LINK[$repo_path]}"

  # Check if the source actually exists in the repo
  if [ ! -e "$source_file" ]; then
    echo "Warning: Source $source_file does not exist. Skipping."
    continue
  fi

  # Create target parent directory if it doesn't exist (e.g., ~/.config/)
  mkdir -p "$(dirname "$target_file")"

  # Handle existing target files/links
  if [ -e "$target_file" ] || [ -L "$target_file" ]; then
    # If it's already a symlink pointing to the right place, skip it
    if [ -L "$target_file" ] && [ "$(readlink "$target_file")" \= "$source_file" ]; then
      echo "Already linked: $target_file"
      continue
    fi

    # Otherwise, back it up safely
    echo "Backing up existing file: $target_file -> $BACKUP_DIR/"
    mkdir -p "$BACKUP_DIR/$(dirname "$repo_path")"
    mv "$target_file" "$BACKUP_DIR/$repo_path"
  fi

  # Create the symbolic link
  echo "Linking: $target_file -> $source_file"
  ln -s "$source_file" "$target_file"
done

echo "All done! Backups (if any) are stored in: $BACKUP_DIR"
