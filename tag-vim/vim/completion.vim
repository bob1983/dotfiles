Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
Plug 'osyo-manga/vim-monster'

let g:deoplete#enable_at_startup = 2
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

