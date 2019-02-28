set secure
set nocompatible
set nomodeline

set mouse=a
set noeb vb t_vb=

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set smartindent

set backspace=indent,eol,start

"set hlsearch
set nohlsearch
set incsearch
set ignorecase
set smartcase

highlight ColorColumn ctermbg=235
set colorcolumn=80

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey85

set wildmenu

"so I can gq for breaking a line into 80 char chunks
set tw=80

"for easier time with comments
"See: https://superuser.com/a/271024
set formatoptions+=cro

"accidentally pressing f1 sucks
nnoremap <F1>   <nop>
inoremap <F1>   <nop>

"tab key remapping stuff
nnoremap th     :tabfirst<CR>
nnoremap tk     :tabnext<CR>
nnoremap tj     :tabprev<CR>
nnoremap tl     :tablast<CR>
nnoremap tt     :tabedit<Space>
nnoremap tn     :tabnext<Space>
nnoremap tm     :tabm<Space>
nnoremap td     :tabclose<CR>

" for opening a quickfix window automatically with :make
" See: http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

syntax on
