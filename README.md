# dotfiles

This repository contains all of my personal development environment configurations, including:
- **Neovim/LazyVim**: My custom Neovim setup with Lua configurations for an enhanced coding experience
- **Tmux**: Terminal multiplexer configurations for efficient session management
- **Zsh**: Shell configurations including Powerlevel10k theme and custom aliases
- **Git**: Git aliases and workflow optimizations

## Repository Structure

```
dotfiles/
├── lua/
│   ├── config/         # Neovim configuration files
│   └── plugins/        # Plugin-specific configurations
├── tmux/              # Tmux configuration files
├── zsh/               # Zsh and shell configurations
└── README.md
```

## Table of Contents
- [Installation](#installation)
- [Neovim Setup](#neovim-setup)
- [Tmux Setup](#tmux-setup)
- [Zsh Setup](#zsh-setup)
- [SSH Configuration](#ssh-configuration)
- [Customization](#customization)
- [License](#license)

## Installation

### Prerequisites
- [Neovim](https://neovim.io/) (>= 0.8.0)
- [Git](https://git-scm.com/)
- [Zsh](https://www.zsh.org/)
- [Tmux](https://github.com/tmux/tmux)

### Quick Setup

1. **Clone this repository**:
    ```bash
    git clone https://github.com/chrstnjsff/devconfig.git ~/.devconfig
    cd ~/.devconfig
    ```

2. **Create symlinks** for the configurations:
    ```bash
    # For Neovim
    ln -sf ~/.devconfig/lua ~/.config/nvim/lua
    
    # For Tmux
    ln -sf ~/.devconfig/tmux/tmux.conf ~/.tmux.conf
    ln -sf ~/.devconfig/tmux/tmux.reset.conf ~/.tmux.reset.conf
    
    # For Zsh
    ln -sf ~/.devconfig/zsh/p10k.zsh ~/.p10k.zsh
    ```

## Neovim Setup

This repository includes custom Lua configurations for Neovim with LazyVim:

- **Location**: `lua/config/` and `lua/plugins/`
- **Features**:
  - LSP configurations for multiple languages
  - Telescope for fuzzy finding
  - Treesitter for syntax highlighting
  - Buffer management with bufferline
  - Custom keymaps and options

### Key Files
- `lua/config/init.lua` - Main configuration entry point
- `lua/config/keymaps.lua` - Custom key bindings
- `lua/config/options.lua` - Neovim options and settings
- `lua/config/lazy.lua` - Lazy.nvim plugin manager setup

### Usage
After creating symlinks, launch Neovim and LazyVim will automatically install and configure plugins:
```bash
nvim
```

## Tmux Setup

Tmux configurations for enhanced terminal session management:

- **Location**: `tmux/`
- **Features**:
  - Custom key bindings
  - Status bar configuration
  - Session management optimizations

### Usage
After symlinking the configuration:
```bash
# Start a new tmux session
tmux

# Or attach to existing session
tmux attach
```

## Zsh Setup

Zsh configuration with Powerlevel10k theme and productivity enhancements:

- **Location**: `zsh/`
- **Features**:
  - Powerlevel10k theme configuration
  - Custom Git aliases and functions
  - Development tool integrations (kubectl, terraform, etc.)
  - SSH agent management

### Key Aliases
- `gc "message"` - Git commit with message
- `gst` - Git status
- `gcob` - Git checkout branch (with fzf)
- `k` - kubectl shorthand
- `tf` - Terraform with AWS vault
- `v` - Neovim shorthand

### Installation
1. Install [Oh My Zsh](https://ohmyz.sh/)
2. Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
3. Symlink the configuration files
4. Run `p10k configure` to set up the theme

## SSH Configuration

For GitHub authentication, this setup includes SSH key management:

1. **Generate SSH key**:
    ```bash
    ssh-keygen -t ed25519 -C "your-email@example.com" -f ~/.ssh/id_ed25519_personal
    ```

2. **Add to SSH agent**:
    ```bash
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519_personal
    ```

3. **Add to GitHub**: Copy the public key and add it to your GitHub account
    ```bash
    cat ~/.ssh/id_ed25519_personal.pub
    ```

## Customization

Feel free to modify any configurations to suit your workflow:

- **Neovim**: Edit files in `lua/config/` for personal preferences
- **Tmux**: Modify `tmux/tmux.conf` for custom key bindings
- **Zsh**: Update aliases and functions in your local `.zshrc`

## License

This project is open source and available under the [MIT License](LICENSE).
