# DevConfig

This repository contains all of my personal development environment configurations, including:

- **LazyVim**: My custom Neovim setup, leveraging LazyVim for an enhanced coding experience.
- **Tmux**: Tmux configurations for efficient terminal session management.

## Table of Contents

- [Installation](#installation)
- [LazyVim Setup](#lazyvim-setup)
- [Tmux Setup](#tmux-setup)
- [Customization](#customization)
- [License](#license)

## Installation

1. **Clone this repository** to your home directory:

    ```bash
    git clone https://github.com/caquino-hoop/devconfig.git ~/.devconfig
    ```

2. **Navigate to the directory**:

    ```bash
    cd ~/.devconfig
    ```

3. **Create symlinks** for the configurations in your home directory:

    ```bash
    # For Neovim
    ln -s ~/.devconfig/.config/nvim ~/.config/nvim

    # For Tmux
    ln -s ~/.devconfig/.tmux.conf ~/.tmux.conf
    ```

## LazyVim Setup

This repository includes my custom configuration for LazyVim:

- **Location**: `.config/nvim/`
- **Plugins**: Configured in the `lua` directory to extend Neovim's capabilities.
- **Keybindings**: Enhanced key mappings for a more efficient workflow.

### Usage

To use this setup, ensure you have [Neovim](https://neovim.io/) installed. Then, create a symlink as shown in the installation steps to set up the configuration.

## Tmux Setup

The `.tmux.conf` file in this repository contains my personalized Tmux settings for an optimized terminal experience.

### Usage

After creating the symlink, simply start Tmux:

```bash
tmux
