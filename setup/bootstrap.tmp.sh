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

function install_pyenv() {
  curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
}

function install_xkeysnail() {
  sudo apt install python3-pip
  sudo pip3 install xkeysnail
}

function install_dropbox() {
  cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
  ~/.dropbox-dist/dropboxd&
}

