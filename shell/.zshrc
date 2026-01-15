# =============================================================================
# ZSH Configuration
# =============================================================================

export ZSH="$HOME/.config/.zsh/oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/.zsh/oh-my-zsh/custom"
export XDG_CONFIG_HOME="$HOME/.config"

# -----------------------------------------------------------------------------
# Oh My Zsh
# -----------------------------------------------------------------------------
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting direnv)
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

# -----------------------------------------------------------------------------
# Direnv
# -----------------------------------------------------------------------------
eval "$(direnv hook zsh)"

# -----------------------------------------------------------------------------
# Syntax Highlighting Theme
# -----------------------------------------------------------------------------
source $ZSH/custom/plugins/catppuccin_mocha-zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

# -----------------------------------------------------------------------------
# History
# -----------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# -----------------------------------------------------------------------------
# Environment
# -----------------------------------------------------------------------------
export TERM=xterm-256color
export EDITOR=vim

# -----------------------------------------------------------------------------
# Path Additions
# -----------------------------------------------------------------------------
export PATH=$PATH:/usr/local/bin
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH=$PATH:/Users/admin/.spicetify
export PATH="$HOME/.local/bin:$PATH"

# -----------------------------------------------------------------------------
# Tool Integrations
# -----------------------------------------------------------------------------

# GHCup (Haskell)
[ -f "/Users/admin/.ghcup/env" ] && source "/Users/admin/.ghcup/env"

# ASDF Version Manager
. "$(brew --prefix asdf)/libexec/asdf.sh"

# Bun
[ -s "/Users/admin/.bun/_bun" ] && source "/Users/admin/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# FZF
source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------
# Add your non-sensitive aliases here

# -----------------------------------------------------------------------------
# Local Configuration (secrets, machine-specific settings)
# -----------------------------------------------------------------------------
# This file is gitignored and should contain:
# - API keys (ANTHROPIC_API_KEY, SPOTIFY_CLIENT_ID, etc.)
# - SSH aliases
# - Machine-specific paths
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
