#!/usr/bin/env bash
# ╒══════╗        ╒═══════╗
# │ ╓──┐ ║════════╗  ╓─┐  ║
# │ ╚══╛ ║──┐  ╓──╜  ║ │  ║  RustyTake-Off
# │ ╓─┐ ╔╝  │  ║  │  ║ │  ║  https://github.com/RustyTake-Off
# │ ║ │ ╚╗  │  ║  │  ╚═╛  ║
# └─╜ └──╜  └──╜  └───────╜
# WSL setup script

get-help() {
  # Help message

  pass
}

get-apt-apps() {
  # Install some prerequisite and utility apps

  sudo apt update && sudo apt upgrade -y

  sudo apt install -y
    apt-transport-https\
    build-essential\
    ca-certificates\
    software-properties-common\
    curl\
    gnupg\
    gpg\
    wget\
    jq\
    fzf\
    ripgrep\
    zoxide

  if [ ! "$(command -v az)" ]; then
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
  fi
}

get-brew() {
  # Install homebrew if not installed

  if [ ! "$(command -v brew)" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Homebrew is already installed!"
  fi
}

get-brew-apps() {
  # Check if homebrew is installed, install if not and install brew apps

  get-brew

#   brew_apps=(
#   "ansible"
#   "azcopy"
#   "helm"
#   "k9s"
#   "kubectl"
#   "nvm"
#   "terragrunt"
#   "tfenv"
#   )

#   for app in "${brew_apps[@]}"; do
#     if [ ! "$(command brew list --versions "$app")" ]; then
#       command brew install "$app"
#       echo "Installing $app..."
#     else
#       command brew upgrade "$app"
#       echo "Updating $app..."
#     fi
#   done
}
