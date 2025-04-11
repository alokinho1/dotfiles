#!/bin/bash

# Step 1: Sync your .config files
$HOME/dotfiles/sync-configs.sh

# Step 2: Push them to GitHub
$HOME/dotfiles/auto-git.sh

