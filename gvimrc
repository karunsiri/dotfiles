" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Set font
if has('gui_gtk2')
  set guifont=Monospace\ 15
elseif has('gui_photon')
  set guifont=Courier\ New:s11
elseif has('gui_kde')
  set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
elseif has('x11')
  set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
elseif has('gui_macvim')
  " set guifont=Menlo\ Regular:h19
  " Enable Fira Code ligatures
  set macligatures

  set guifont=Fira\ Code\ Light:h19
else
  set guifont=Menlo\ Regular:h18
endif

" Disable scrollbars on left and right
set guioptions-=r
set guioptions-=L
set nocursorline

set novb

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif
