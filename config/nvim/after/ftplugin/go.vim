let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_autodetect_gopath = 1

nnoremap <silent><Leader>gr :GoRun<CR>
nnoremap <silent><Leader>gd :GoDocBrowser<CR>
nnoremap <silent><Leader>gt :<C-u>call go#def#Jump("tab")<CR>
nnoremap <silent>gp :GoDeclsDir<CR>
