#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname -s)"

INSTALL_VSCODE_EXTS=false
APPLY_MACOS_DEFAULTS=false

usage() {
    cat <<EOF
Usage: ./install.sh [options]

Symlinks dotfiles for the current OS (Linux or macOS). Existing files are
backed up with a timestamp before being replaced.

Options:
  --vscode      Install VSCode extensions from vscode/extensions.txt
  --defaults    Apply macOS system preferences via macos/defaults.sh (macOS only)
  -h, --help    Show this help message
EOF
}

for arg in "$@"; do
    case "$arg" in
        --vscode)   INSTALL_VSCODE_EXTS=true ;;
        --defaults) APPLY_MACOS_DEFAULTS=true ;;
        -h|--help)  usage; exit 0 ;;
        *)          echo "Unknown option: $arg" >&2; usage; exit 1 ;;
    esac
done

link_file() {
    local src="$1"
    local dst="$2"

    mkdir -p "$(dirname "$dst")"

    if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
        echo "Already linked: $dst"
        return
    fi

    if [[ -e "$dst" || -L "$dst" ]]; then
        local backup="${dst}.backup.$(date +%Y%m%d%H%M%S)"
        mv "$dst" "$backup"
        echo "Backed up existing $dst -> $backup"
    fi

    ln -s "$src" "$dst"
    echo "Linked: $dst -> $src"
}

echo "Setting up dotfiles for $OS from $DOTFILES_DIR..."

# Shared configs
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

case "$OS" in
    Darwin)
        link_file "$DOTFILES_DIR/macos/.zshrc" "$HOME/.zshrc"
        link_file "$DOTFILES_DIR/macos/.zprofile" "$HOME/.zprofile"
        link_file "$DOTFILES_DIR/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
        link_file "$DOTFILES_DIR/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

        if [[ "$APPLY_MACOS_DEFAULTS" == true ]]; then
            "$DOTFILES_DIR/macos/defaults.sh"
        fi
        ;;
    Linux)
        link_file "$DOTFILES_DIR/linux/.zshrc" "$HOME/.zshrc"
        link_file "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"
        link_file "$DOTFILES_DIR/vscode/settings.json" "$HOME/.config/Code/User/settings.json"

        if [[ "$APPLY_MACOS_DEFAULTS" == true ]]; then
            echo "Note: --defaults is macOS-only and was skipped on Linux."
        fi
        ;;
    *)
        echo "Unsupported OS: $OS" >&2
        exit 1
        ;;
esac

if [[ "$INSTALL_VSCODE_EXTS" == true ]]; then
    if command -v code >/dev/null 2>&1; then
        echo "Installing VSCode extensions..."
        xargs -L1 code --install-extension < "$DOTFILES_DIR/vscode/extensions.txt"
    else
        echo "Skipping VSCode extensions: 'code' CLI not found in PATH."
    fi
fi

echo "Done! Run 'exec zsh' to reload your shell."
