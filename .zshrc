# === P10k instant prompt

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# === Oh My Zsh and Powerlevel10k theme loading
source ~/.config/zsh/oh-my-zsh.sh

# === P10k config
# Must be sourced AFTER theme loading by oh my zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# === Load all alias files
echo "Loading aliases from ~/.config/aliases/*"
if [ -d ~/.config/aliases ]; then
    for alias_file in ~/.config/aliases/*.sh; do
        [ -f "$alias_file" ] && source "$alias_file"
    done
fi

# === Alias for working with dotfiles bare git repo

alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# ===
