" General Settings

set secure
set nomodeline
set nocompatible

set mouse=a
set noeb vb t_vb=
set wildmenu
set backspace=indent,eol,start

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set smartindent

set nohlsearch
set incsearch
set ignorecase
set smartcase

set tw=120
set formatoptions=qlc

highlight ColorColumn ctermbg=235
set colorcolumn=120

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey85

" for separators
set encoding=utf8
set fillchars=vert:│
hi VertSplit cterm=NONE



" Key Remapping

" prevent accidentally popping up the help window 
nnoremap <F1> <nop>
inoremap <F1> <nop>

" easier tab navigation
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

" zooming a split like in tmux
" See: https://medium.com/@vinodkri/zooming-vim-window-splits-like-a-pro-d7a9317d40
noremap Zi <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

" auto closing items
inoremap ' ''<left>
inoremap '' ''
inoremap " ""<left>
inoremap "" ""
inoremap ( ()<left>
inoremap ()) ()
inoremap [ []<left>
inoremap []] []
inoremap { {  }<left><left>
inoremap {}} { }
inoremap {<CR> {<CR>}<ESC>kA
inoremap /*<CR> /*<CR>/<ESC>kA



" Per-Filetype Settings

autocmd BufEnter *.txt set filetype=text

autocmd FileType make set noexpandtab
autocmd FileType text set linebreak

" for opening a quickfix window automatically with :make
" See: http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
