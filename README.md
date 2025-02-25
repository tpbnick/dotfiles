# dotfiles
my dotfiles and other dev related stuff

## Apps Install
Install command:
```shell
# If using arch-based distro
cat apps.txt | xargs -L1 pamac install
```

## Fonts
[Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- Hack
- Space Mono

## VSCode Setup
Install extensions:
```shell
cd vscode
cat extensions.txt | xargs -L1 code --install-extension
```

Copy `settings.json` into user settings in VSCode.
