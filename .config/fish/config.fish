set -U fish_greeting


pfetch

fish_add_path /home/alokinho/.spicetify
fish_add_path /home/alokinho/.local/bin

if test -e ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
end

starship init fish | source
