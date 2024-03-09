# dotfiles
my dotfiles and other dev related stuff

## Fonts
VSCode:
- [MonoLisa](https://github.com/lauer3912/Monolisa)

Terminal:
- [SpaceMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/SpaceMono.zip)

## VSCode Setup
Install [VSCode](https://aur.archlinux.org/packages/visual-studio-code-bin):
`pamac install visual-studio-code-bin`

Install extensions:
```shell
cat extensions.txt | xargs -L1 code --install-extension
```

Copy `settings.json` into user settings in VSCode.
