utils.create_augroup('pymodeMappings', {
  { 'FileType', 'python', 'nnoremap', '<buffer><silent> gd :call pymode#rope#goto_definition()<CR>' },
})
