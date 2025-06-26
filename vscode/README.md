# VSCode Setup

## Install extensions:

```shell
cd vscode
# Linux
cat extensions.txt | xargs -L1 code --install-extension
# Windows (Powershell)
gc extensions.txt | % { code --install-extension $_ }
```

Copy `settings.json` into user settings in VSCode.
