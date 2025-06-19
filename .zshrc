# run `exec zsh` after updating to refresh zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# ------
# Plugins
# https://github.com/tamcore/autoupdate-oh-my-zsh-plugins
# https://github.com/zsh-users/zsh-autosuggestions
# https://github.com/zsh-users/zsh-syntax-highlighting
# ------
plugins=(autoupdate copypath dirhistory git history pyenv sudo zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR='micro'

# ------
# Aliases
# -------

alias updatesys='sudo pacman -Syyu'
alias open='dolphin . >/dev/null 2>&1 &'
alias c='code .'
alias home='cd ~'

# ctrl delete/backspace functionality
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

# Enable starship (starship.rs) - install: `curl -sS https://starship.rs/install.sh | sh`
eval "$(starship init zsh)"
source /home/nick/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
