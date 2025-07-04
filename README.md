# dotfiles

my dotfiles and other dev related stuff

## Apps Install

This is a list of current (as of 06/19/25) apps I have installed via [Scoop](https://scoop.sh).

Install with `scoop import scoop-list.json`. May also need a `scoop update *` after initial install to update all applications.

Note: Some applications are better installed outside of Scoop (PowerToys, PowerShell, Sublime Text) and should be installed via conventional methods (direct download/Microsoft Store).

Powershell profile also included as `PowerShell_profile.ps1`. How to install:

```sh
# Check if PROFILE exists
if (-not (Test-Path $PROFILE)) {
    # Create PROFILE if it doesn't exist
    New-Item -Path $PROFILE -Type File -Force
}

# Push contents of PowerShell_profile.ps1 into PROFILE
Set-Content -Path $PROFILE -Value (Get-Content -Path ".\PowerShell_profile.ps1")

# Reload PROFILE
. $PROFILE
```

<details>
<summary><strong>Applications</strong></summary>

## 🌐 Web Browsers

- **[Chromium](https://github.com/chromium/chromium)**

<details>
<summary><strong>Extensions</strong></summary>

- Adguard
- Bitwarden
- DarkReader
- Base64 Decoder
- Decentraleyes
- Google Analytics Opt-Out
- I still don't care about cookies
- UBlock Origin Lite
- Don't Track Me Google
- Enhancer For Youtube
- Humble New Tab Page
- Modern for Wikipedia
- Return Youtube Dislike
- SponsorBlock

</details>

## 📝 Text Editors & IDEs

- **[VSCode](https://github.com/microsoft/vscode)**
- **[Sublime Text](https://www.sublimetext.com/)**
- **[micro](https://github.com/zyedidia/micro)**

## 📋 Text Expansion

- **[Espanso](https://github.com/espanso/espanso)**

## 📚 Reading & Note-Taking

- **[Obsidian](https://obsidian.md/)**
- **[FBReader](https://fbreader.org/)**

## 🎵 Media & Entertainment

- **[Spotify](https://www.spotify.com/)**
- **[mpvNet](https://github.com/stax76/mpv.net)**
- **[Discord](https://discord.com/)**

## 📺 TV & Streaming

- **[OpenTV](https://opentv.github.io/)**

## 🛠 System Utilities

- **[PowerToys](https://github.com/microsoft/PowerToys)**
- **[FlowLauncher](https://github.com/Flow-Launcher/Flow.Launcher)**
- **[AltSnap](https://github.com/RamonUnch/AltSnap)**
- **[TranslucentTB](https://github.com/TranslucentTB/TranslucentTB)**

## 🖼 Media & Graphics

- **[ShareX](https://github.com/ShareX/ShareX)**
- **[Paint.NET](https://www.getpaint.net/)**

## 🔍 Search & File Management

- **[Everything](https://www.voidtools.com/)**
- **[WinSCP](https://winscp.net/)**

## 🌐 Network, Security, & Backup

- **[Mullvad](https://mullvad.net/)**
- **[BlueBubbles](https://github.com/BlueBubblesApp/BlueBubbles-Server)**
- **[TailScale](https://tailscale.com/)**
- **[Syncthing](https://github.com/syncthing/syncthing)**

## 🎨 Terminal & Shell

> Remember to install PowerShell profile!

- **[fd](https://github.com/sharkdp/fd)**
- **[fzf](https://github.com/junegunn/fzf)**
- **[PowerShell](https://github.com/PowerShell/PowerShell)**
- **[ripgrep](https://github.com/BurntSushi/ripgrep)**
- **[Starship](https://github.com/starship/starship)**
- **[Zoxide](https://github.com/ajeetdsouza/zoxide)**

## 🔤 Fonts

- **[Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)** (SpaceMono and Hack)

</details>

## Fonts

### [Nerd Fonts](https://www.nerdfonts.com/font-downloads)

- Hack
- Space Mono

## VSCode Setup

### Install extensions:

```shell
cd vscode
# Linux
cat extensions.txt | xargs -L1 code --install-extension
# Windows (Powershell)
gc extensions.txt | % { code --install-extension $_ }
```

Copy `settings.json` into user settings in VSCode.
