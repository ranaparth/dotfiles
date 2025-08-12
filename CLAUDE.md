# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository forked from Mathias Bynens' dotfiles. It contains shell configuration files, macOS settings, and automation scripts for setting up a development environment on macOS.

## Key Components

### Core Shell Configuration
- `.bash_profile` - Main bash configuration that sources other dotfiles
- `.bashrc` - Additional bash settings
- `.bash_prompt` - Custom bash prompt configuration
- `.exports` - Environment variable exports
- `.aliases` - Custom command aliases
- `.functions` - Custom bash functions

### Development Tools Configuration
- `.gitconfig` - Git configuration
- `.vimrc` / `.gvimrc` - Vim editor configuration
- `.editorconfig` - Editor settings for consistent formatting
- `bin/` - Custom executables and scripts

### macOS Configuration
- `.macos` - Comprehensive macOS system defaults and preferences
- `.osx` - Legacy macOS settings (may be outdated)
- `init/` - Contains theme files and editor settings:
  - Sublime Text keymap and preferences
  - Solarized color schemes for terminal and iTerm

## Common Commands

### Initial Setup
```bash
# Clone and install dotfiles
git clone https://github.com/ranaparth/dotfiles.git && cd dotfiles && source bootstrap.sh

# Install Homebrew packages
./brew.sh

# Apply macOS system preferences
./.macos
```

### Updates
```bash
# Update dotfiles (with confirmation prompt)
source bootstrap.sh

# Force update without confirmation
set -- -f; source bootstrap.sh
```

### Customization
- Create `~/.extra` for private/custom settings that shouldn't be committed
- Create `~/.path` to extend the PATH environment variable
- Both files are automatically sourced if they exist

## Architecture Notes

### Bootstrap Process
The `bootstrap.sh` script:
1. Pulls latest changes from the master branch
2. Uses rsync to copy dotfiles to home directory (excluding git files, README, etc.)
3. Sources the updated `.bash_profile` to apply changes immediately

### Shell Initialization Flow
The `.bash_profile` loads configuration files in this order:
1. `~/.path` (if exists) - PATH extensions
2. `~/.bash_prompt` - Custom prompt
3. `~/.exports` - Environment variables
4. `~/.aliases` - Command aliases
5. `~/.functions` - Custom functions
6. `~/.extra` (if exists) - Private/custom settings

### Homebrew Integration
- `brew.sh` installs essential command-line tools and utilities
- Updates to latest Homebrew and upgrades existing packages
- Installs GNU core utilities, newer bash, vim, and development tools
- Most CTF/security tools are commented out but available

## Important Files to Understand

- `bootstrap.sh:8-14` - Core sync logic using rsync
- `.bash_profile:7-9` - Dotfiles loading mechanism
- `brew.sh:25-33` - Bash 4 installation and shell switching
- `.macos` - Extensive macOS customization (500+ lines of defaults commands)

## Development Workflow

When modifying this repository:
1. Test changes in the local dotfiles directory first
2. Use `source bootstrap.sh` to sync and test changes
3. Commit changes to version control
4. The setup is designed to be idempotent - running scripts multiple times is safe