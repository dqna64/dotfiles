# Gordon's dotfiles

Dotfiles repo in the form of a bare git repo. That means the repo is just a `.git` and the actual files are scatter across `$HOME` directory (mostly in `~/.config/`).

## Install

```
# Clone to your machine as a bare git repo
$ git clone --bare git@github.com:dqna64/dotfiles $HOME/.dotfiles

# Create an alias for managing the dotfiles repo with git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Hide untracked files (otherwise your entire home directory shows up in `git status`)
dotfiles config --local status.showUntrackedFiles no

# Checkout the dotfiles
dotfiles checkout
```
