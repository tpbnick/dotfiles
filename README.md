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
# Linux
cat extensions.txt | xargs -L1 code --install-extension
# Windows (Powershell)
gc extensions.txt | % { code --install-extension $_ }
```

Copy `settings.json` into user settings in VSCode.
