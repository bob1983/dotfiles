# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby osx brew emoji-clock)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='atom'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# AWS Cloudsearch
export CS_HOME="$HOME/tools/cloud-search-tools-v2-2.0.0.1-2014.03.14"
export PATH=$PATH:$CS_HOME/bin
export AWS_CREDENTIAL_FILE="$HOME/aws-stulio-bob-account-key"
export CS_ENDPOINT=cloudsearch.ap-northeast-1.amazonaws.com

export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
PATH=${JAVA_HOME}/bin:${PATH}

# nodejs
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin/npm:$PATH

# pyenv
eval "$(pyenv init -)"

# vim
alias vi='env LANG=ja_JP.UTF-8 $HOME/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 $HOME/Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# direnv
eval "$(direnv hook zsh)"

# kiex
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

if [ -f ~/.brew_github_api_token ]; then
  source ~/.brew_github_api_token
fi

# go
export GOROOT=/usr/local/Cellar/go
export GOPATH="$HOME/.go"
export PATH="$GOPATH:$PATH"

source ~/.aws_config

# vs code
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
