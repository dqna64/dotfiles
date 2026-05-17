If you have vscode installed on your machine and you want it to use these json config files
in this directory, you'll need to copy these settings into the path that your vscode
installation expects these settings to be found.

One easy way is to create a symlink in the path that vscode expects, pointing back to these
files.

For example on macOS:
 
```bash
ln -s "$HOME/.config/vscode/User/settings.json" "$HOME/Library/Application\ Support/Code/User/settings.json"
ln -s "$HOME/.config/vscode/User/keybindings.json" "$HOME/Library/Application\ Support/Code/User/keybindings.json"
```

