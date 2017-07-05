
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


" 日本語周りの設定 {{{1
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    if has('mac')
      let &fileencodings = s:enc_jis .','. s:enc_euc
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    else
      let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    endif
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif


set clipboard+=unnamed,autoselect
