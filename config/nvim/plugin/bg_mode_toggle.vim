" Toggle between Vim 'dark' and 'light' mode.
" Some color schemes support dark and light mode. To enable toggling by a
" keyboard shortcut while not having to type in code should make life easier.
function! s:ToggleBackgroundMode()
  let current_bg = &background

  if current_bg == 'dark'
    exec 'set background=light'
    let current_bg = 'light'
  else
    exec 'set background=dark'
    let current_bg = 'dark'
  endif
  " echomsg 'Using '.current_bg.' mode'
  echo 'Using '.current_bg.' mode'
endfunction

command! ToggleBackgroundMode :call s:ToggleBackgroundMode()
nnoremap <silent><F11> :ToggleBackgroundMode<cr>
