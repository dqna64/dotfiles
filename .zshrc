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
dotfiles config core.fsmonitor false
dotfiles config --local status.showUntrackedFiles no

# ===

bindkey "[D" backward-word
bindkey "[C" forward-word

# === Yabai window management

if [[ "$ENABLE_YABAI_DQNA64" == "true" ]]; then
    ~/.config/yabai/start.sh

    local YABAI_ALIASES_PATH="$HOME/.config/yabai/aliases.zsh" 
    if [ -f "$YABAI_ALIASES_PATH" ]; then
	source "$YABAI_ALIASES_PATH"
    fi
fi

# === Exports
local EXPORTS_PATH="$HOME/.config/zsh/exports.sh"
echo "Loading exports from $EXPORTS_PATH"
if [ -f "$EXPORTS_PATH" ]; then
	source $EXPORTS_PATH
fi

# === ripgrep config
# When running ripgrep `$ rg`, it will use the defaults set in the file
# whose path specified at this env var:
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgreprc"

# === Add cnv work binaries path to path env var, if exists

if [[ -n "$CNV_WORK_BIN_PATH" ]]; then
	echo helloo
	#path=("${CNV_WORK_BIN_PATH}" $path)
	export PATH="${CNV_WORK_BIN_PATH}:$PATH"
	# ^^ use zsh array view `path` of `PATH` env var to prepend the new value to path
fi

# ===
