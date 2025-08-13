#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# Updated for 2025 - modern packages and removed deprecated options

# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install latest zsh (macOS includes zsh but install latest version)
brew install zsh

# Ensure zsh is in allowed shells and set as default
BREW_PREFIX=$(brew --prefix)
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

# Install `wget` (removed deprecated --with-iri option)
brew install wget

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen

# Install modern development tools
brew install git
brew install git-lfs
brew install node

# Python installation and setup
brew install python@3.12  # Latest stable version
brew install python@3.11  # LTS version
brew install python@3.10  # For compatibility

# Python package managers and tools
brew install pipx  # For installing Python applications in isolated environments
brew install poetry  # Modern Python dependency management

# Install font tools (check if tap still exists).
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install modern productivity and development tools
brew install tree
brew install htop
brew install jq
brew install ripgrep
brew install fd
brew install bat
brew install exa
brew install fzf

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries (uncomment as needed)
brew install ack
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install speedtest-cli
brew install ssh-copy-id
brew install testssl
brew install vbindiff
brew install zopfli

# Install modern alternatives
brew install eza  # modern replacement for ls
brew install zoxide  # smarter cd command
brew install starship  # cross-shell prompt

# Install oh-my-zsh and powerlevel10k theme
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install powerlevel10k theme
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Installing powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install zsh plugins (some may be included in oh-my-zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2>/dev/null || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2>/dev/null || true
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions 2>/dev/null || true

# Install zsh enhancements via Homebrew (as backup)
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install zsh-completions

# Install miniconda for Python package and environment management
brew install --cask miniconda

# Initialize conda (add to shell path)
if [ -f "$HOME/miniconda3/bin/conda" ]; then
    echo "Initializing conda for current shell..."
    "$HOME/miniconda3/bin/conda" init "$(basename "${SHELL}")"
    echo "Conda initialized. You may need to restart your shell or run 'source ~/.zshrc'"
fi

# Python development tools
brew install black  # Code formatter
brew install flake8  # Linting
brew install mypy  # Type checking
brew install pytest  # Testing framework

# Remove outdated versions from the cellar.
brew cleanup
