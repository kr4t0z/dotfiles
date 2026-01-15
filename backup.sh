#!/bin/bash

# =============================================================================
# Dotfiles Backup Script
# =============================================================================
# Syncs changes from source locations to dotfiles repo and commits/pushes
# Run periodically via cron or launchd

set -e

DOTFILES_DIR="$HOME/dotfiles"
LOG_FILE="$DOTFILES_DIR/.backup.log"

# Colors (disabled if not interactive)
if [ -t 1 ]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    NC='\033[0m'
else
    RED='' GREEN='' YELLOW='' NC=''
fi

log() {
    local msg="[$(date '+%Y-%m-%d %H:%M:%S')] $1"
    echo -e "$msg"
    echo "$msg" >> "$LOG_FILE"
}

log_info() { log "${GREEN}[INFO]${NC} $1"; }
log_warn() { log "${YELLOW}[WARN]${NC} $1"; }
log_error() { log "${RED}[ERROR]${NC} $1"; }

# Rotate log file if > 1MB
if [ -f "$LOG_FILE" ] && [ $(stat -f%z "$LOG_FILE" 2>/dev/null || echo 0) -gt 1048576 ]; then
    mv "$LOG_FILE" "$LOG_FILE.old"
fi

log_info "Starting dotfiles backup..."

# -----------------------------------------------------------------------------
# Sync files from source to dotfiles repo
# -----------------------------------------------------------------------------

sync_file() {
    local src="$1"
    local dest="$2"

    if [ -f "$src" ] || [ -d "$src" ]; then
        # Check if source is a symlink pointing to our dotfiles (skip if so)
        if [ -L "$src" ]; then
            local link_target=$(readlink "$src")
            if [[ "$link_target" == *"dotfiles"* ]]; then
                return 0
            fi
        fi

        mkdir -p "$(dirname "$dest")"

        if [ -d "$src" ]; then
            rsync -a --delete --exclude='.git' --exclude='.claude' --exclude='.neoconf.json' "$src/" "$dest/"
        else
            cp "$src" "$dest"
        fi
    fi
}

# Shell configs
sync_file "$HOME/.config/.zsh/.zshrc" "$DOTFILES_DIR/shell/.zshrc"
sync_file "$HOME/.zshenv" "$DOTFILES_DIR/shell/.zshenv"
sync_file "$HOME/.bashrc" "$DOTFILES_DIR/shell/.bashrc"

# Git
sync_file "$HOME/.gitconfig" "$DOTFILES_DIR/git/.gitconfig"

# Tmux
sync_file "$HOME/.tmux.conf" "$DOTFILES_DIR/tmux/.tmux.conf"

# Neovim (sync directory)
sync_file "$HOME/.config/nvim" "$DOTFILES_DIR/nvim"

# Ghostty
sync_file "$HOME/.config/ghostty/config" "$DOTFILES_DIR/ghostty/config"
sync_file "$HOME/.config/ghostty/themes" "$DOTFILES_DIR/ghostty/themes"

# Yabai
sync_file "$HOME/.config/yabai/yabairc" "$DOTFILES_DIR/yabai/yabairc"
sync_file "$HOME/.config/yabai/toggle-zoom.sh" "$DOTFILES_DIR/yabai/toggle-zoom.sh"

# Skhd
sync_file "$HOME/.config/skhd/skhdrc" "$DOTFILES_DIR/skhd/skhdrc"

# Sketchybar (sync directory)
sync_file "$HOME/.config/sketchybar" "$DOTFILES_DIR/sketchybar"

# FZF
sync_file "$HOME/.fzf.zsh" "$DOTFILES_DIR/fzf/.fzf.zsh"
sync_file "$HOME/.fzf.bash" "$DOTFILES_DIR/fzf/.fzf.bash"

# Karabiner
sync_file "$HOME/.config/karabiner/karabiner.json" "$DOTFILES_DIR/karabiner/karabiner.json"

log_info "Files synced"

# -----------------------------------------------------------------------------
# Git commit and push if there are changes
# -----------------------------------------------------------------------------

cd "$DOTFILES_DIR"

# Check for changes
if [ -z "$(git status --porcelain)" ]; then
    log_info "No changes to commit"
    exit 0
fi

# Show what changed
log_info "Changes detected:"
git status --short >> "$LOG_FILE"
git status --short

# Stage all changes
git add -A

# Create commit with timestamp
COMMIT_MSG="Auto-backup $(date '+%Y-%m-%d %H:%M')"
git commit -m "$COMMIT_MSG"
log_info "Committed: $COMMIT_MSG"

# Push if remote exists
if git remote get-url origin &>/dev/null; then
    if git push; then
        log_info "Pushed to remote"
    else
        log_warn "Failed to push (will retry next run)"
    fi
else
    log_warn "No remote configured - skipping push"
fi

log_info "Backup complete"
