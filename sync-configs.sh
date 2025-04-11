#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/dotfiles/.config"
IGNORE_FILE="$HOME/dotfiles/.syncignore"
IGNORE_LIST=()

# Load ignore list
if [ -f "$IGNORE_FILE" ]; then
    mapfile -t IGNORE_LIST < "$IGNORE_FILE"
fi

mkdir -p "$BACKUP_DIR"

echo "Copying ~/.config files to $BACKUP_DIR"

cd "$CONFIG_DIR"

for item in *; do
    src="$CONFIG_DIR/$item"
    dest="$BACKUP_DIR/$item"

    # Skip ignored
    if [[ " ${IGNORE_LIST[@]} " =~ " ${item} " ]]; then
        echo "Ignoring $item"
        continue
    fi

    echo "Copying $src to $dest"
    rm -rf "$dest"
    cp -r "$src" "$dest"
done

echo "Done syncing configs."

