#!/bin/bash

function change_default_dir_name() {
  LANG=C xdg-user-dirs-gtk-update
}

function apt_cleanup() {
  sudo apt autoremove
}

function apt_update() {
  sudo apt update
  sudo apt upgrade -y
}

function install_essential() {
  sudo apt-get install -y \
  curl gcc direnv jq tig tmux git silversearcher-ag xclip rxvt-unicode-256color
}

function install_zsh() {
  sudo apt-get install -y zsh
  chsh -s $(which zsh)
}

function install_zplug() {
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
}

function install_xkeysnail() {
  sudo apt install python3-pip
  sudo pip3 install xkeysnail
}

function install_gnome_keychain() {
  sudo apt-get install libgnome-keyring-dev -y
  sudo make --directory=/usr/share/doc/git/contrib/credential/gnome-keyring
}


# change_default_dir_name
# apt_cleanup
# apt_update
# install_essential
# install_zsh
# install_zplug
# install_xkeysnail
# install_gnome_keychain
# install_zplug
