# dotfiles
my dotfiles and other dev related stuff

## Apps Install
Install command:
```shell
cat apps.txt | xargs -L1 pamac install
```

## Fonts
VSCode:
- [MonoLisa](https://github.com/lauer3912/Monolisa)

Terminal:
- [SpaceMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/SpaceMono.zip)

## VSCode Setup
Install extensions:
```shell
cd vscode
cat extensions.txt | xargs -L1 code --install-extension
```

Copy `settings.json` into user settings in VSCode.
