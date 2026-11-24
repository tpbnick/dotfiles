#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
    echo "macos/defaults.sh can only be run on macOS." >&2
    exit 1
fi

echo "Applying macOS system defaults..."

# Close System Settings to prevent it from overriding changes
osascript -e 'tell application "System Settings" to quit' >/dev/null 2>&1 || true

# --- Appearance ---
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# --- Keyboard, Trackpad & Input ---
# Disable automatic period substitution on double-space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# Enable tap to click (built-in & Bluetooth trackpads)
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# Disable three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool false
# Disable clicking wallpaper to reveal desktop
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# --- Dock ---
# Auto-hide Dock with long hover delay (effectively hides Dock on hover)
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 1000
# Icon size & magnification
defaults write com.apple.dock tilesize -int 69
defaults write com.apple.dock magnification -bool false
# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false
# Minimize windows into their application icon using scale effect
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock mineffect -string "scale"

# --- Finder ---
# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show path bar and status bar
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Open new Finder windows in Home directory
defaults write com.apple.finder NewWindowTarget -string "PfHm"
# Hide drives and removable media on Desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# --- Desktop Services ---
# Avoid creating .DS_Store files on network and USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Restart affected UI services
for app in Dock Finder SystemUIServer; do
    killall "$app" >/dev/null 2>&1 || true
done

echo "macOS defaults applied! Some changes (e.g. trackpad, scroll direction, dark mode) may require logging out and back in."
