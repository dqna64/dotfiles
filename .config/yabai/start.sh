#!/bin/zsh
# ~/.config/yabai/start.sh
# Yabai daemon will look for a yabai config file at one
# of these locations (in order):
# - $XDG_CONFIG_HOME/yabai/yabairc
# - $HOME/.config/yabai/yabairc
# - $HOME/.yabairc

# Check if yabai is running
if ! pgrep -x "yabai" > /dev/null; then
    echo "Starting yabai service..."
    yabai --start-service
    #/usr/bin/env sh "$HOME/.config/yabai/yabairc"
    echo "Yabai started"
else
    if (( VERBOSITY_DQNA64 >= 2 )); then
    	echo "Yabai is already running"
    fi
fi

