#!/bin/zsh
# ~/.config/yabai/start.sh
# Yabai daemon will look for a yabai config file at one
# of these locations (in order):
# - $XDG_CONFIG_HOME/yabai/yabairc
# - $HOME/.config/yabai/yabairc
# - $HOME/.yabairc

/usr/bin/env sh "$HOME/.config/yabai/yabairc"

# Check if yabai is running
if ! pgrep -x "yabai" > /dev/null; then
    echo "Starting yabai service..."
    yabai --start-service
    echo "Yabai started"
else
    echo "Yabai is already running"
fi

# === Aliases
alias yfff="$HOME/.config/yabai/firefox_fifths.sh"

