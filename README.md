# dotfiles
# Usage

Need to install [rcm](https://github.com/thoughtbot/rcm)

## Setup for ubuntu

```
# Install git
sudo apt-get update
sudo apt-get install git -y
# Clone this repository
git clone https://github.com/bob1983/dotfiles
cd ./dotfiles
# Run bootstrap script to install ansible
./bootstrap.sh
# Run ansible-playbook
ansible-playbook ansible/bootstrap.yml --ask-valut-pass
```
## Bootstrap
Need to symlink dotfiles/rcrc to $HOME/.rcrc

```
env RCRC=$HOME/dotfiles/rcrc rcup
```

## Install programming languages

```
# Install ruby with rbenv
setup/ruby.sh
# Install python with rbenv
setup/python.sh
```
