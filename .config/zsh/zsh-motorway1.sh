# ==============================================================================
# This file contains zsh configurations specifically for Gordon's motorway1
# macOS machine. DO NOT run on any machine other than motorway1.
# ==============================================================================

# === Add cmake to PATH env var for 6771
#PATH="/Applications/CMake.app/Contents/bin":"$PATH"

### ============= Path ==============
# Created by `userpath` on 2023-04-14 07:02:51
# export PATH="$PATH:/Users/me/.local/bin"
# Manually replace with this line
export PATH="$HOME/.local/bin":$PATH

# ===

export PATH=$PATH:"$HOME/nvim-macos/bin"

# ===

export PATH=$PATH:"/Users/me/Library/Python/3.9/bin"

# ===

[ -f "/Users/me/.ghcup/env" ] && source "/Users/me/.ghcup/env" # ghcup-env

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# ===

### Set default java version
export JAVA_HOME=$(/usr/libexec/java_home -v 22) # use temurin 22
export PATH=$JAVA_HOME/bin:$PATH


### Add apache maven to PATH
export PATH=/Library/apache-maven-3.9.9/bin:$PATH

# === start yabai tiling window manager
#/usr/bin/env sh ~/.config/yabai/yabairc

# === Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/me/.lmstudio/bin"
# End of LM Studio CLI section



