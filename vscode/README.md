# VSCode Setup

Run all commands from the root of this repository.

## Install Extensions

Both Linux and macOS use the same command:

```sh
cat vscode/extensions.txt | xargs -L1 code --install-extension
```

## Copy `settings.json`

- **Linux:**
  ```sh
  mkdir -p ~/.config/Code/User
  cp vscode/settings.json ~/.config/Code/User/settings.json
  ```
- **macOS:**
  ```sh
  mkdir -p "$HOME/Library/Application Support/Code/User"
  cp vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
  ```
