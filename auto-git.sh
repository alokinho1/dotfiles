#!/bin/bash

cd "$HOME/dotfiles"

git add .

if git diff --cached --quiet; then
    echo "No changes to commit."
    exit 0
fi

git commit -m "Auto backup: $(date '+%Y-%m-%d %H:%M:%S')"
git push origin master

