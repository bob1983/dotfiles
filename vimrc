
" モードラインを有効にして、5行目までをモードラインとして検索{{{1
" set modeline
" set modelines=5

" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype indent plugin on

" 表示関連 {{{1
" 色づけをオン
syntax on
" 画面最下行にルーラーを表示する
set ruler
" ステータスラインを常に表示する
set laststatus=2
" タイプ途中のコマンドを画面最下行に表示
set showcmd
" コマンドラインの高さを2行に
set cmdheight=2

" 行番号を表示
set number
" タブ文字、行末など不可視文字を表示する
set list
" listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
" 閉じカッコが入力されたとき、対応するカッコを表示
set showmatch


" インデント関連のオプション {{{1
" オートインデント
set autoindent
" タブ文字の代わりにスペース2個を使う場合の設定。
" この場合、'tabstop'はデフォルトの8から変えない。
set shiftwidth=2
set softtabstop=2
" タブの代わりにスペースを使用する
set expandtab
" 新しい行を作った時に高度な自動なインデントを行う
set smartindent
" 行頭の余白内でTabを打ち込むと、'shiftwidth'の数だけインデントする
set smarttab
" 入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/


" 共通設定 {{{1
set noswapfile

set nobackup

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" コマンドライン補完を便利に
set wildmenu
" コピーした文字で、繰り返し上書きペースト
vnoremap <silent> <C-p> "0p<CR>

" コピペ時にコメントアウトされてしまう問題の対応
autocmd FileType * setlocal formatoptions-=ro

" 検索関連 {{{1
" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch
" インクリメンタルサーチを行う
set incsearch
" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" 操作関連 {{{1
" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 全モードでマウスを有効化
set mouse=a
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" カーソルの設定
imap OA <Up>
imap OB <Down>
imap OD <Left>
imap OC <Right>
" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" そしてビジュアルベルも無効化する
set t_vb=
" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" <F11>キーで'paste'と'nopaste'を切り替える
set pastetoggle=<F11>



" マッピング{{{1
" Yの動作をDやCと同じにする
map Y y$
" <C-L>で検索後の強調表示を解除する
nnoremap <C-L> :nohl<CR><C-L>
" ESCを押した時にIMEをオフにする
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
" Ctrl-cをESCに割り当てる
inoremap <C-c> <Esc>

set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileformat=unix

set nocompatible

" Need to set the leader before defining any leader mappings
let mapleader = "\<Space>"

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call s:SourceConfigFilesIn('rcfiles')

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('kien/ctrlp.vim')
call minpac#add('mileszs/ack.vim')
call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('editorconfig/editorconfig-vim')

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

set clipboard+=unnamed,autoselect

" Edit crontab with vim
if $VIM_CRONTAB == 'true'
  set nobackup
  set nowritebackup
endif
