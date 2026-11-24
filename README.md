# dotfiles

My dotfiles and dev environment setup, kept synced across **Linux (Debian / Ubuntu)** and **macOS**.

## Repository Structure

```text
.
├── ghostty/
│   └── config            # Shared Ghostty terminal config
├── linux/
│   ├── .zshrc            # Zsh config (Zinit + Starship + Zoxide + Fzf)
│   └── packages.txt      # Debian / Ubuntu apt package list
├── macos/
│   ├── .zshrc            # Zsh config (synced with linux/.zshrc)
│   ├── .zprofile         # Homebrew & OrbStack login shell environment
│   └── Brewfile          # Homebrew formulae & casks
├── vscode/
│   ├── README.md         # VSCode setup instructions
│   ├── extensions.txt    # VSCode extensions list
│   └── settings.json     # VSCode user settings
└── .gitconfig            # Shared Git configuration
```

## Table of Contents

- **[Linux](#linux)**
  - [Packages](#linux-packages)
  - [Shell Setup](#linux-shell-setup)
  - [Fonts](#linux-fonts)
  - [Applications](#linux-applications)
  - [Git and VSCode](#linux-git-and-vscode)
- **[macOS](#macos)**
  - [Packages](#macos-packages)
  - [Shell Setup](#macos-shell-setup)
  - [Fonts](#macos-fonts)
  - [Applications](#macos-applications)
  - [Git and VSCode](#macos-git-and-vscode)

---

## Linux

Targeted at **Debian / Ubuntu** (`apt`) with universal installers for tools that ship newer versions upstream.

### Linux Packages

Install base packages from [`linux/packages.txt`](./linux/packages.txt):

```sh
sudo apt update && sudo apt upgrade -y
grep -vE '^\s*(#|$)' linux/packages.txt | xargs sudo apt install -y
```

Install tools not packaged (or older) in default `apt` repos:

```sh
# Starship prompt
curl -sS https://starship.rs/install.sh | sh

# Bun
curl -fsSL https://bun.sh/install | bash

# Rust / Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# uv (Python package manager)
curl -LsSf https://astral.sh/uv/install.sh | sh

# eza (modern ls) & yt-dlp (via cargo / pipx)
cargo install eza
pipx install yt-dlp
```

> **Note:** On older Debian/Ubuntu releases, `apt`'s `fzf` may be older than `0.48` (before `fzf --zsh` was added). `linux/.zshrc` automatically falls back to `/usr/share/doc/fzf/examples/key-bindings.zsh`, or you can install the latest `fzf` from [GitHub releases](https://github.com/junegunn/fzf#using-git).

### Linux Shell Setup

Uses **Zsh** with **Zinit**, **Starship**, **Zoxide**, and **Fzf** (no separate Oh My Zsh install needed — Zinit pulls only the OMZ snippets used) — synced with the macOS setup.

1. Set Zsh as the default shell:
   ```sh
   chsh -s "$(which zsh)"
   ```
2. Symlink [`linux/.zshrc`](./linux/.zshrc) and [`ghostty/config`](./ghostty/config):
   ```sh
   ln -sf "$PWD/linux/.zshrc" ~/.zshrc
   mkdir -p ~/.config/ghostty
   ln -sf "$PWD/ghostty/config" ~/.config/ghostty/config
   ```
3. Reload Zsh (Zinit automatically bootstraps itself and installs plugins on first launch):
   ```sh
   exec zsh
   ```

**Included Zinit plugins & snippets:**
- `zsh-users/zsh-completions`
- `Aloxaf/fzf-tab`
- `zsh-users/zsh-autosuggestions`
- `zsh-users/zsh-syntax-highlighting`
- `zsh-users/zsh-history-substring-search`
- `OMZL::git.zsh`, `OMZP::git`, `OMZP::sudo`, `OMZP::command-not-found`

### Linux Fonts

Install [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (`Hack` and `SpaceMono`):

```sh
mkdir -p ~/.local/share/fonts
# Download Hack and SpaceMono from https://www.nerdfonts.com/font-downloads, unzip into ~/.local/share/fonts, then:
fc-cache -fv
```

### Linux Applications

<details>
<summary><strong>Applications</strong></summary>

#### Web Browsers
- **[Google Chrome](https://www.google.com/chrome/)** / **[Chromium](https://github.com/chromium/chromium)** / **[Brave](https://brave.com/)**

<details>
<summary><strong>Browser Extensions</strong></summary>

- AdGuard
- Bitwarden
- DarkReader
- Base64 Decoder
- Decentraleyes
- Google Analytics Opt-Out
- I still don't care about cookies
- uBlock Origin Lite
- Don't Track Me Google
- Enhancer for YouTube
- Humble New Tab Page
- Modern for Wikipedia
- Return YouTube Dislike
- SponsorBlock

</details>

#### Text Editors, IDEs & Terminals
- **[Ghostty](https://ghostty.org/)**
- **[VSCode](https://github.com/microsoft/vscode)**
- **[Zed](https://zed.dev/)**
- **[micro](https://github.com/zyedidia/micro)**

#### Reading & Note-Taking
- **[Obsidian](https://obsidian.md/)**

#### Media & Communication
- **[Spotify](https://www.spotify.com/)**
- **[mpv](https://mpv.io/)**
- **[IPTVnator](https://github.com/4gray/iptvnator)**
- **[Discord](https://discord.com/)**
- **[Slack](https://slack.com/)**
- **[Telegram](https://desktop.telegram.org/)**
- **[Steam](https://store.steampowered.com/)**

#### Network, Security & Remote
- **[Bitwarden](https://bitwarden.com/)**
- **[Ente Auth](https://ente.io/auth/)**
- **[Mullvad VPN](https://mullvad.net/)**
- **[Tailscale](https://tailscale.com/)**
- **[RustDesk](https://rustdesk.com/)**

#### Containers, Cloud & Utilities
- **[Docker Engine](https://docs.docker.com/engine/install/)**
- **[Helm](https://helm.sh/)**, **[k9s](https://k9scli.io/)**, **[Terraform](https://www.terraform.io/)**, **[lazygit](https://github.com/jesseduffield/lazygit)**, **[lazydocker](https://github.com/jesseduffield/lazydocker)**
- **[Pinta](https://www.pinta-project.com/)**

#### Terminal & Shell
- **[eza](https://github.com/eza-community/eza)**
- **[fd](https://github.com/sharkdp/fd)**
- **[fzf](https://github.com/junegunn/fzf)**
- **[ripgrep](https://github.com/BurntSushi/ripgrep)**
- **[Starship](https://github.com/starship/starship)**
- **[Zoxide](https://github.com/ajeetdsouza/zoxide)**

</details>

### Linux Git and VSCode

```sh
# Git config
ln -sf "$PWD/.gitconfig" ~/.gitconfig

# VSCode extensions & settings
cat vscode/extensions.txt | xargs -L1 code --install-extension
mkdir -p ~/.config/Code/User
cp vscode/settings.json ~/.config/Code/User/settings.json
```

---

## macOS

Managed with [Homebrew](https://brew.sh/) (`macos/Brewfile`) and kept synced with the Linux setup.

### macOS Packages

1. Install [Homebrew](https://brew.sh/):
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Install all CLI tools, fonts, and apps from [`macos/Brewfile`](./macos/Brewfile):
   ```sh
   brew bundle --file=macos/Brewfile
   ```
3. Install Bun (managed outside Homebrew to match `~/.zshrc`):
   ```sh
   curl -fsSL https://bun.sh/install | bash
   ```

### macOS Shell Setup

Uses **[Ghostty](https://ghostty.org/)** + **Zsh** with **Zinit**, **Starship**, **Zoxide**, and **Fzf** (no separate Oh My Zsh install needed — Zinit pulls only the OMZ snippets used) — synced with the Linux setup.

1. Symlink [`macos/.zshrc`](./macos/.zshrc), [`macos/.zprofile`](./macos/.zprofile), and [`ghostty/config`](./ghostty/config):
   ```sh
   ln -sf "$PWD/macos/.zshrc" ~/.zshrc
   ln -sf "$PWD/macos/.zprofile" ~/.zprofile
   mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
   ln -sf "$PWD/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
   ```
2. Reload Zsh (Zinit automatically bootstraps itself and installs plugins on first launch):
   ```sh
   exec zsh
   ```

**Included Zinit plugins & snippets:**
- `zsh-users/zsh-completions`
- `Aloxaf/fzf-tab`
- `zsh-users/zsh-autosuggestions`
- `zsh-users/zsh-syntax-highlighting`
- `zsh-users/zsh-history-substring-search`
- `OMZL::git.zsh`, `OMZP::git`, `OMZP::sudo`, `OMZP::command-not-found`

### macOS Fonts

`font-hack-nerd-font` is installed automatically via [`macos/Brewfile`](./macos/Brewfile) (used by Ghostty and VSCode). You can also install SpaceMono Nerd Font:

```sh
brew install --cask font-space-mono-nerd-font
```

### macOS Applications

<details>
<summary><strong>Applications</strong></summary>

#### Web Browsers
- **[Google Chrome](https://www.google.com/chrome/)** / **[Brave](https://brave.com/)** / Safari

<details>
<summary><strong>Browser Extensions</strong></summary>

- AdGuard
- Bitwarden
- DarkReader
- Base64 Decoder
- Decentraleyes
- Google Analytics Opt-Out
- I still don't care about cookies
- uBlock Origin Lite
- Don't Track Me Google
- Enhancer for YouTube
- Humble New Tab Page
- Modern for Wikipedia
- Return YouTube Dislike
- SponsorBlock

</details>

#### Text Editors, IDEs & Terminals
- **[Ghostty](https://ghostty.org/)** (primary terminal)
- **[VSCode](https://github.com/microsoft/vscode)**
- **[Zed](https://zed.dev/)**
- **[micro](https://github.com/zyedidia/micro)**

#### Reading & Note-Taking
- **[Obsidian](https://obsidian.md/)**

#### Media & Communication
- **[Spotify](https://www.spotify.com/)**
- **[IINA](https://iina.io/)** / **[mpv](https://mpv.io/)**
- **[IPTVnator](https://github.com/4gray/iptvnator)**
- **[Discord](https://discord.com/)**
- **[Slack](https://slack.com/)**
- **[Telegram](https://desktop.telegram.org/)**
- **[Steam](https://store.steampowered.com/)**

#### Network, Security & Remote
- **[Bitwarden](https://bitwarden.com/)**
- **[Ente Auth](https://ente.io/auth/)**
- **[Mullvad VPN](https://mullvad.net/)**
- **[Tailscale](https://tailscale.com/)**
- **[RustDesk](https://rustdesk.com/)**

#### Containers, Cloud & macOS Utilities
- **[OrbStack](https://orbstack.dev/)**
- **[Helm](https://helm.sh/)**, **[k9s](https://k9scli.io/)**, **[Terraform](https://www.terraform.io/)**, **[lazygit](https://github.com/jesseduffield/lazygit)**, **[lazydocker](https://github.com/jesseduffield/lazydocker)**
- **[Raycast](https://www.raycast.com/)**
- **[Rectangle](https://rectangleapp.com/)**
- **[Itsycal](https://www.mowglii.com/itsycal/)**
- **[Mac Mouse Fix](https://macmousefix.com/)**
- **[Keka](https://www.keka.io/)**
- **[Cyberduck](https://cyberduck.io/)**
- **[Pinta](https://www.pinta-project.com/)**
- **[Blip](https://blip.net/)**

#### Terminal & Shell
- **[eza](https://github.com/eza-community/eza)**
- **[fd](https://github.com/sharkdp/fd)**
- **[fzf](https://github.com/junegunn/fzf)**
- **[ripgrep](https://github.com/BurntSushi/ripgrep)**
- **[Starship](https://github.com/starship/starship)**
- **[Zoxide](https://github.com/ajeetdsouza/zoxide)**

</details>

### macOS Git and VSCode

```sh
# Git config
ln -sf "$PWD/.gitconfig" ~/.gitconfig

# VSCode extensions & settings
cat vscode/extensions.txt | xargs -L1 code --install-extension
mkdir -p "$HOME/Library/Application Support/Code/User"
cp vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
```
