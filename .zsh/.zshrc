export ZSH="$HOME/.config/.zsh/oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/.zsh/oh-my-zsh/custom"
export SPOTIFY_CLIENT_ID='61d7f7549c6c4b9299e0cd0fe22457d4'
export SPOTIFY_CLIENT_SECRET='3b9015d15f3247238b21d1abbb620a41'


ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"

source $ZSH/custom/plugins/catppuccin_mocha-zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

alias sshpix='ssh root@62.72.26.210'

[ -f "/Users/admin/.ghcup/env" ] && source "/Users/admin/.ghcup/env" # ghcup-env
export PATH=$PATH:/usr/local/bin
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export PATH=$PATH:/Users/admin/.spicetify
