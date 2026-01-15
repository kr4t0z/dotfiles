#!/bin/bash

# =============================================================================
# Dotfiles Installation Script
# =============================================================================
# Creates symlinks from home directory to dotfiles

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Create backup directory
mkdir -p "$BACKUP_DIR"
log_info "Backup directory: $BACKUP_DIR"

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"

    if [ -e "$target" ] || [ -L "$target" ]; then
        log_warn "Backing up existing: $target"
        mv "$target" "$BACKUP_DIR/"
    fi

    # Create parent directory if needed
    mkdir -p "$(dirname "$target")"

    ln -sf "$source" "$target"
    log_info "Linked: $target -> $source"
}

echo ""
echo "========================================"
echo "  Dotfiles Installation"
echo "========================================"
echo ""

# -----------------------------------------------------------------------------
# Shell
# -----------------------------------------------------------------------------
log_info "Installing shell configs..."
create_symlink "$DOTFILES_DIR/shell/.zshrc" "$HOME/.config/.zsh/.zshrc"
create_symlink "$DOTFILES_DIR/shell/.zshenv" "$HOME/.zshenv"
create_symlink "$DOTFILES_DIR/shell/.bashrc" "$HOME/.bashrc"

# Create .zshrc symlink in home if it doesn't exist
if [ ! -L "$HOME/.zshrc" ]; then
    create_symlink "$HOME/.config/.zsh/.zshrc" "$HOME/.zshrc"
fi

# -----------------------------------------------------------------------------
# Git
# -----------------------------------------------------------------------------
log_info "Installing git config..."
create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

# -----------------------------------------------------------------------------
# Tmux
# -----------------------------------------------------------------------------
log_info "Installing tmux config..."
create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# -----------------------------------------------------------------------------
# Neovim
# -----------------------------------------------------------------------------
log_info "Installing neovim config..."
mkdir -p "$HOME/.config/nvim"
for file in "$DOTFILES_DIR/nvim"/*; do
    filename=$(basename "$file")
    create_symlink "$file" "$HOME/.config/nvim/$filename"
done

# -----------------------------------------------------------------------------
# Ghostty
# -----------------------------------------------------------------------------
log_info "Installing ghostty config..."
mkdir -p "$HOME/.config/ghostty"
create_symlink "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"
if [ -d "$DOTFILES_DIR/ghostty/themes" ]; then
    create_symlink "$DOTFILES_DIR/ghostty/themes" "$HOME/.config/ghostty/themes"
fi

# -----------------------------------------------------------------------------
# Yabai
# -----------------------------------------------------------------------------
log_info "Installing yabai config..."
mkdir -p "$HOME/.config/yabai"
create_symlink "$DOTFILES_DIR/yabai/yabairc" "$HOME/.config/yabai/yabairc"
if [ -f "$DOTFILES_DIR/yabai/toggle-zoom.sh" ]; then
    create_symlink "$DOTFILES_DIR/yabai/toggle-zoom.sh" "$HOME/.config/yabai/toggle-zoom.sh"
fi

# -----------------------------------------------------------------------------
# Skhd
# -----------------------------------------------------------------------------
log_info "Installing skhd config..."
mkdir -p "$HOME/.config/skhd"
create_symlink "$DOTFILES_DIR/skhd/skhdrc" "$HOME/.config/skhd/skhdrc"

# -----------------------------------------------------------------------------
# Sketchybar
# -----------------------------------------------------------------------------
log_info "Installing sketchybar config..."
mkdir -p "$HOME/.config/sketchybar"
for file in "$DOTFILES_DIR/sketchybar"/*; do
    filename=$(basename "$file")
    create_symlink "$file" "$HOME/.config/sketchybar/$filename"
done

# -----------------------------------------------------------------------------
# FZF
# -----------------------------------------------------------------------------
log_info "Installing fzf config..."
create_symlink "$DOTFILES_DIR/fzf/.fzf.zsh" "$HOME/.fzf.zsh"
create_symlink "$DOTFILES_DIR/fzf/.fzf.bash" "$HOME/.fzf.bash"

# -----------------------------------------------------------------------------
# Karabiner
# -----------------------------------------------------------------------------
log_info "Installing karabiner config..."
mkdir -p "$HOME/.config/karabiner"
create_symlink "$DOTFILES_DIR/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

# -----------------------------------------------------------------------------
# Local config reminder
# -----------------------------------------------------------------------------
echo ""
echo "========================================"
echo "  Installation Complete!"
echo "========================================"
echo ""
if [ ! -f "$HOME/.zshrc.local" ]; then
    log_warn "Don't forget to create ~/.zshrc.local for your secrets!"
    log_info "Copy the template: cp $DOTFILES_DIR/shell/.zshrc.local.example ~/.zshrc.local"
fi
echo ""
log_info "Backup of old configs: $BACKUP_DIR"
echo ""
