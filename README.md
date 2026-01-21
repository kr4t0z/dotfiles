# Dotfiles

My macOS dotfiles for a productive development environment.

## What's Included

| Directory | Description |
|-----------|-------------|
| `shell/` | Zsh and Bash configurations |
| `git/` | Git configuration |
| `tmux/` | Tmux with Catppuccin theme and useful plugins |
| `nvim/` | Neovim configuration (Lazy.nvim based) |
| `ghostty/` | Ghostty terminal config with Catppuccin Mocha |
| `yabai/` | Yabai tiling window manager |
| `skhd/` | Skhd hotkey daemon for yabai |
| `sketchybar/` | Sketchybar status bar |
| `fzf/` | Fuzzy finder shell integrations |
| `karabiner/` | Karabiner-Elements keyboard customization |

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   ```

2. Run the install script:
   ```bash
   cd ~/dotfiles
   ./install.sh
   ```
   The script will prompt to install dependencies via Homebrew (git, neovim, tmux, fzf, yabai, skhd, sketchybar, ghostty, karabiner-elements).

3. Create your local secrets file:
   ```bash
   cp ~/dotfiles/shell/.zshrc.local.example ~/.zshrc.local
   # Edit ~/.zshrc.local with your API keys and secrets
   ```

4. Restart your shell or run:
   ```bash
   source ~/.zshrc
   ```

### Install Options

```bash
./install.sh              # Interactive: prompts for deps, then creates symlinks
./install.sh --no-deps    # Skip dependency installation, only create symlinks
./install.sh --deps-only  # Only install dependencies, skip symlinks
./install.sh --help       # Show help
```

### Additional Dependencies (Manual)

Some tools require manual installation:

```bash
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Other useful tools (optional)
brew install direnv asdf
```

## Post-Installation

### Tmux
Press `prefix + I` (default: `Ctrl-b + I`) to install tmux plugins.

### Yabai
Start the services:
```bash
yabai --start-service
skhd --start-service
```

### Neovim
Open neovim and let Lazy.nvim install plugins:
```bash
nvim
```

## Key Bindings

### Yabai/Skhd
| Binding | Action |
|---------|--------|
| `alt + hjkl` | Focus window (vim-style) |
| `shift + alt + hjkl` | Swap windows |
| `shift + alt + m` | Toggle fullscreen |
| `shift + alt + t` | Toggle float |
| `shift + alt + 1-7` | Move window to space |
| `ctrl + alt + r` | Restart yabai |

### Tmux
Uses default tmux bindings plus plugins:
- `prefix + I` - Install plugins
- Mouse enabled for scrolling and pane selection

## Secret Management

The `.zshrc` sources `~/.zshrc.local` for machine-specific secrets. This file should contain:
- API keys (Anthropic, Spotify, etc.)
- SSH aliases
- Machine-specific paths

**Never commit `.zshrc.local` to version control!**

## Customization

- Shell theme: Robbyrussell (Oh My Zsh)
- Color scheme: Catppuccin Mocha (terminal, syntax highlighting, tmux)
- Font: Maple Mono (ghostty)
