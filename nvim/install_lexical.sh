#!/bin/bash

# Install Lexical LSP for Elixir
LEXICAL_DIR="$HOME/.local/share/nvim/lexical"

# Remove old installation if exists
if [ -d "$LEXICAL_DIR" ]; then
    echo "Removing old Lexical installation..."
    rm -rf "$LEXICAL_DIR"
fi

# Clone Lexical repository
echo "Cloning Lexical repository..."
git clone https://github.com/lexical-lsp/lexical.git "$LEXICAL_DIR"

# Build Lexical
cd "$LEXICAL_DIR"
echo "Building Lexical..."

# For umbrella projects, we need to build from the apps directory
cd apps/server
mix deps.get
cd ../..

# Now build the release
mix deps.get
mix package

echo "Lexical LSP installed successfully!"
echo "Location: $LEXICAL_DIR"