#!/usr/bin/env bash
# ╒══════╗        ╒═══════╗
# │ ╓──┐ ║════════╗  ╓─┐  ║
# │ ╚══╛ ║──┐  ╓──╜  ║ │  ║  RustyTake-Off
# │ ╓─┐ ╔╝  │  ║  │  ║ │  ║  https://github.com/RustyTake-Off
# │ ║ │ ╚╗  │  ║  │  ╚═╛  ║
# └─╜ └──╜  └──╜  └───────╜
# WSL setup script

# Repository      -   "https://github.com/RustyTake-Off/wsl-dotfiles",
# Script file     -   "https://github.com/RustyTake-Off/wsl-dotfiles/blob/main/.local/bin/use-wslup.sh"

# ================================================================================
# Main variables

# REPO_URL="https://github.com/RustyTake-Off/wsl-dotfiles.git"

# ================================================================================
# Miscellaneous code

if [ ! -d "$HOME/pr" ]; then
  command mkdir "$HOME/pr"
  echo "Creating 'personal' directory"
fi

if [ ! -d "$HOME/wk" ]; then
  command mkdir "$HOME/wk"
  echo "Creating 'work' directory"
fi

# ================================================================================
# Main functions

function get_help() {
  # Help message

  echo "Available commands:"
  echo "  -h  | --help            - Prints help message"
  echo "  -a  | --apt-apps        - Installs apt applications"
  echo "  -b  | --brew            - Installs homebrew"
  echo "  -ba | --brew-apps       - Installs brew applications"
  echo "  -d  | --dotfiles        - Invokes Dotfiles setup script"
}

function get_apt_apps() {
  # Install some prerequisite and utility apps

  sudo apt update && sudo apt upgrade -y

  sudo apt install -y \
    apt-transport-https \
    build-essential \
    ca-certificates \
    software-properties-common \
    curl \
    gnupg \
    gpg \
    wget \
    python3-venv \
    python3-pip \
    python3-tk \
    tree \
    jq \
    fzf \
    ripgrep \
    zoxide

  # Install azure cli
  if [ ! "$(command -v az)" ]; then
    echo "Installing Azure cli..."
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
  fi

  # Install azure developer cli
  if [ ! "$(command -v azd)" ]; then
    echo "Installing Azure Develope cli..."
    curl -fsSL https://aka.ms/install-azd.sh | bash
  fi
}

function get_brew() {
  # Install homebrew if not installed

  if [ ! "$(command -v brew)" ]; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Homebrew is already installed!"
  fi
}

function get_brew_apps() {
  # Check if homebrew is installed, install if not and install brew apps

  get-brew

  if [ ! "$(command -v brew)" ]; then
    command brew install \
      ansible \
      azcopy \
      kubectl \
      helm \
      k9s \
      nvm \
      tfenv \
      terragrunt \
      tlrc \
      entr
  fi
}

function set_dotfiles() {
  # Invokes the Dotfiles setup script

  echo "Invoking Dotfiles setup script..."
  if [ -x "$HOME/.local/bin/set-dotfiles.sh" ]; then
    source "$HOME/.local/bin/set-dotfiles.sh"
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/RustyTake-Off/wsl-dotfiles/main/.local/bin/set-dotfiles.sh)"
  fi
  echo "Invoke complete!"
}

# Switch with possible commands
case "$1" in
  -h|--help)
    get_help
    ;;
  -a|--apt-apps)
    get_apt_apps
    ;;
  -b|--brew)
    get_brew
    ;;
  -ba|--brew-apps)
    get_brew_apps
    ;;
  -d|--dotfiles)
    set_dotfiles
    ;;
  *)
    get_help
    ;;
esac
