# 🌱 alokinho's Dotfiles

Similar to GNU Stow but with automated bash scripts 

Credits: ChatGPT

---

## 🛠️ Requirements

Make sure these are installed:

- `git`
- `fish`
- `dunst` (for desktop notifications)
- `notify-send` (from `libnotify`)
- `curl` (optional, for additional scripts)

- `cava`
- `fish`
- `kitty`
- `nvim`
- `pywal-16`
- `waybar`
- `waypaper`
- `wlogout`
- `wofi`
- `zathura
- `clipse

---

## 📁 Directory Structure

Your `$HOME/dotfiles` will contain:
```
dotfiles/
├── .config/ # Symlinked config folders live here 
├── .git/ # Git repository 
├── .gitignore # Ignore list for Git 
├── .syncignore # Ignore list for config sync 
├── auto-git.sh # Git wrapper to auto commit and push 
├── sync-and-push.sh # Main sync and push script 
├── sync.log # Log file for sync activity
```
Feel free to delete `.git` and `.gitignore` and other files if you dont want to use the sctipts 

---

## ⚙️ Setup Instructions

### 1. 📥 Clone the Repo

Clone this repo and move it's contents to .config except `.sh` files if you dont want to use the scripts

```
git clone https://github.com/alokinho1/dotfiles.git
```

# Only do these if you're me. (alokinho)

## 🔗 Symlink Config Files

Add folders you don’t want to sync from `~/.config` to `.syncignore`
Then run:

```
cd ~/dotfiles
./sync-and-push.sh
```
This will create symlinks inside `~/dotfiles/.config` pointing to your real files in `~/.config`.

## 🔁 Automate It with systemd
Save the following files in `~/.config/systemd/user/`:

    dotfiles-sync.service :
  ```  
[Unit]
Description=Sync and push dotfiles to GitHub

[Service]
Type=oneshot
ExecStart=/home/alokinho/dotfiles/sync-and-push.sh
```

    dotfiles-sync.timer :
```
[Unit]
Description=Run dotfiles sync-and-push every 3 hours

[Timer]
OnBootSec=1min
OnUnitActiveSec=12h
Persistent=true

[Install]
WantedBy=timers.target

```

Then run:
```
systemctl --user daemon-reload
systemctl --user enable --now dotfiles-sync.timer
```

This sets up a 12-hour sync and push cycle.
Check it with 
```
systemctl --user list-timers --all | grep dotfiles-sync
```

## 🔔 Notifications
After a successful push, you’ll see a notification using `notify-send` and `dunst`.

You can change this in `auto-git.sh`.

## 💡 Manual Usage
You can run this anytime:
```
cd dotfiles
./sync-and-push.sh
```

## 🧼 Notes
Avoid pushing sensitive files (tokens, credentials).

Make sure to edit `.config` only

Make sure .syncignore and .gitignore are set up properly to avoid clutter.

## 📄 To-Do

1. Add .timer & .service scripts in the README ✔️
2. Learn GNU Stow
3. Screenshots because why not
