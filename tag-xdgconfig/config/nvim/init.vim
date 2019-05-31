call plug#begin('~/.config/nvim/plugged')

" source ~/.vim/ctags.vim
source ~/.vim/ag.vim
source ~/.vim/airline.vim
source ~/.vim/completion.vim
source ~/.vim/vimdiff.vim
source ~/.vim/plugins.vim
source ~/.vim/ruby.vim
source ~/.vim/javascript.vim
source ~/.vim/typescript.vim
source ~/.vim/fzf.vim

call plug#end()

syntax enable

source ~/.vim/base_config.vim
source ~/.vim/theme.vim
source ~/.vim/keybindings.vim
source ~/.vim/buffer.vim
