-- Ale linting events
utils.create_augroup('ale', {
  { 'VimEnter', '*', 'set',
    [[  updatetime=1000 |
      \ let g:ale_lint_on_text_changed = 0]]
  },
  { 'CursorHold', '*', 'call', 'ale#Queue(0)' },
  { 'CursorHoldI', '*', 'call', 'ale#Queue(0)' },
  { 'InsertEnter', '*', 'call', 'ale#Queue(0)' },
  { 'InsertLeave', '*', 'call', 'ale#Queue(0)' },
})
