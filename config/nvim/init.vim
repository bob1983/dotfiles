" Plugins

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'qpkorr/vim-bufkill'

Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'editorconfig/editorconfig-vim'
Plug 'chrisbra/vim-diff-enhanced'

"" For ruby
Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
Plug 'osyo-manga/vim-monster'
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'haml', 'eruby'] }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'coffee', 'javascript'] }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'craigemery/vim-autotag'
Plug 'scrooloose/syntastic'

call plug#end()

"   Plug settings
""  ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"" deoplete

let g:deoplete#enable_at_startup = 1
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

"" ctags

let g:autotagTagsFile=".tags"
nnoremap <C-]> g<C-]>

"" syntastic

let g:systastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

"" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"" vim-diff-enhanced
if &diff
  let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

" Base settings
" refs: https://qiita.com/nrk_baby/items/154e3fa15c48a39e3375

set encoding=utf-8
set fileencoding=utf-8

syntax enable

" tabs indents
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set shiftround
filetype plugin indent on

" scroll
set scrolloff=5

" backup
set noswapfile
set nowritebackup

" views
set number
set showmatch
set wrap
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set virtualedit=onemore
set ambiwidth=double

" search
set ignorecase
set smartcase

" edit
set clipboard=unnamed
set hidden
set switchbuf=useopen
set mouse=a
set sh=zsh

" map keys
"" Off IME on pushing esc
inoremap <silent> <Esc> <Esc>:set iminsert=0<CR>

"" Assign Ctrl-c to esc
inoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

"" tig
nnoremap tig :<C-u>w<CR>:te tig<CR>

"" Emacs like keybindings
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Delete>
inoremap <C-h> <Backspace>

"" Indentation
nnoremap > >>
nnoremap < <<
vnoremap > >
vnoremap < <

"" Remove highlight with Escape
nnoremap <Esc> :noh<return><Esc>
nnoremap <C-c> :noh<return><Esc>
