function install_pyenv() {
  curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
}

function install_essential() {
  sudo apt-get install -y \
  curl gcc direnv jq tig tmux git silversearcher-ag xclip rxvt-unicode-256color
}

function install_xkeysnail() {
  sudo apt install python3-pip
  sudo pip3 install xkeysnail
}
