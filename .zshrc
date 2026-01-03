DOTFILES_DIR="$HOME/.config"

# === Source zsh config

ZSH_CONFIG_FILE="$DOTFILES_DIR/zsh/zsh-config"

if [[ ! -f "$ZSH_CONFIG_FILE" ]]; then
    echo "Creating default zsh config file..."
    cp -v "${ZSH_CONFIG_FILE}.example" "$ZSH_CONFIG_FILE"
    echo "You can update zsh configs at $ZSH_CONFIG_FILE"
fi

source "$ZSH_CONFIG_FILE"

# === P10k instant prompt

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ "$ENABLE_P10K_INSTANT_PROMPT" == "true" && -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# === Oh My Zsh and Powerlevel10k theme loading

source ~/.config/zsh/oh-my-zsh.sh

# === Set zsh theme
# Must be sourced AFTER theme loading by oh my zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ $ZSH_THEME_MY == "p10k" ]]; then
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
elif [[ $ZSH_THEME_MY == "starship" ]]; then
  eval "$(starship init zsh)"
fi

# ===

# === Load all alias files
echo "Loading aliases from ~/.config/aliases/*"
if [ -d ~/.config/aliases ]; then
    for alias_file in ~/.config/aliases/*.sh; do
        [ -f "$alias_file" ] && source "$alias_file"
    done
fi

# === Alias for working with dotfiles bare git repo

alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
dotfiles config --local status.showUntrackedFiles no

# ===

bindkey "[D" backward-word
bindkey "[C" forward-word

# ===

if [[ "$ENABLE_YABAI_DQNA64" == "true" ]]; then
    ~/.config/yabai/start.sh

    local YABAI_ALIASES_PATH="$HOME/.config/yabai/aliases.zsh" 
    if [ -f "$YABAI_ALIASES_PATH" ]; then
	source "$YABAI_ALIASES_PATH"
    fi
fi

