# Gordon's dotfiles

Dotfiles repo in the form of a bare git repo. That means the repo contains just a `.git` and the actual files are scattered across `$HOME` directory (mostly in `~/.config/`). So this repo can be cloned into `~/.dotfiles-dqna64` while tracking files outside this directory.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/dqna64/dotfiles/main/install.sh | bash
```

## Usage

For git operations for this repo, use the `dotfiles` alias command instead the `git` command

```bash
dotfiles add ~/.zshrc
dotfiles commit -m 'update .zshrc'
dotfiles pull
dotfiles push
```

## Git setup (optional)

The custom git setup script does:

- set primary and secondary git author identities which you can switch between using `git primary` and `git secondary` and check with `git-whoami`
- set primary and secondary github accounts by ssh key paths, which you can switch between using `git ssh-primary` and `git ssh-secondary` and check with `git ssh-whoami`

```bash
bash ~/.config/git/git-setup.sh
```

## Todo

- [ ] print cp instructions for git identity instead of automatically cp
- [x] readme details about git setup
- [ ] readme info about config variables
- [ ] vim and nvim dotfiles
- [ ] .gitignore for machine-specific files
