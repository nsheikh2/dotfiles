set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

if has("unix")
    set guifont=Ubuntu\ Mono\ Regular\ 11
else
    set guifont=Consolas:h12
endif

colorscheme peachpuff

set vb t_vb=
