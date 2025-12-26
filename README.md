# Gordon's dotfiles

Dotfiles repo in the form of a bare git repo. That means the repo is just a `.git` and the actual files are scatter across `$HOME` directory (mostly in `~/.config/`).

## Install

```
# Clone to your machine as a bare git repo
$ git clone --bare git@github.com:dqna64/dotfiles.git $HOME/.dotfiles

# Create an alias for managing the dotfiles repo with git
$ alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Hide untracked files (otherwise your entire home directory shows up in `git status`)
$ dotfiles config --local status.showUntrackedFiles no

# Checkout the dotfiles (will error if some files from dotfiles already
# exist on your machine)
$ dotfiles checkout
```

## Git setup (optional)

The custom git setup script does:

- set primary and secondary git author identities which you can switch between using `git primary` and `git secondary` and check with `git-whoami`
- set primary and secondary github accounts by ssh key paths, which you can switch between using `git ssh-primary` and `git ssh-secondary` and check with `git ssh-whoami`

```
$ bash ~/.config/git/git-setup.sh
```

## Todo

- [ ] print cp instructions for git identity instead of automatically cp
- [x] readme details about git setup
- [ ] readme info about config variables
- [ ] vim and nvim dotfiles
