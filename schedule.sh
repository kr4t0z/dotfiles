#!/bin/bash

# =============================================================================
# Dotfiles Backup Scheduler
# =============================================================================
# Install/uninstall periodic backup via macOS launchd

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLIST_NAME="com.dotfiles.backup"
PLIST_SRC="$DOTFILES_DIR/$PLIST_NAME.plist"
PLIST_DEST="$HOME/Library/LaunchAgents/$PLIST_NAME.plist"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

usage() {
    echo "Usage: $0 [install|uninstall|status]"
    echo ""
    echo "Commands:"
    echo "  install    Install and start hourly backup"
    echo "  uninstall  Stop and remove scheduled backup"
    echo "  status     Check if backup is scheduled"
    echo ""
    exit 1
}

install_schedule() {
    echo -e "${GREEN}Installing dotfiles backup schedule...${NC}"

    # Create LaunchAgents directory if needed
    mkdir -p "$HOME/Library/LaunchAgents"

    # Unload if already loaded
    launchctl unload "$PLIST_DEST" 2>/dev/null || true

    # Copy plist (expand $HOME)
    sed "s|\$HOME|$HOME|g" "$PLIST_SRC" > "$PLIST_DEST"

    # Load the agent
    launchctl load "$PLIST_DEST"

    echo -e "${GREEN}Backup scheduled to run every hour${NC}"
    echo ""
    echo "To change frequency, edit: $PLIST_DEST"
    echo "  StartInterval = seconds between runs (3600 = 1 hour)"
    echo ""
    echo "View logs:"
    echo "  cat ~/dotfiles/.backup.log"
    echo "  cat /tmp/dotfiles-backup.out"
}

uninstall_schedule() {
    echo -e "${YELLOW}Uninstalling dotfiles backup schedule...${NC}"

    if [ -f "$PLIST_DEST" ]; then
        launchctl unload "$PLIST_DEST" 2>/dev/null || true
        rm "$PLIST_DEST"
        echo -e "${GREEN}Backup schedule removed${NC}"
    else
        echo "No schedule found"
    fi
}

check_status() {
    echo "Checking backup schedule status..."
    echo ""

    if launchctl list | grep -q "$PLIST_NAME"; then
        echo -e "${GREEN}Status: ACTIVE${NC}"
        echo ""
        launchctl list | grep "$PLIST_NAME"
    else
        echo -e "${YELLOW}Status: NOT SCHEDULED${NC}"
        echo "Run '$0 install' to enable hourly backups"
    fi

    echo ""
    if [ -f "$DOTFILES_DIR/.backup.log" ]; then
        echo "Last 5 log entries:"
        tail -5 "$DOTFILES_DIR/.backup.log"
    fi
}

# Make backup script executable
chmod +x "$DOTFILES_DIR/backup.sh"

case "${1:-}" in
    install)
        install_schedule
        ;;
    uninstall)
        uninstall_schedule
        ;;
    status)
        check_status
        ;;
    *)
        usage
        ;;
esac
