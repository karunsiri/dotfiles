local M = {} -- The module to export
local cmd = vim.cmd

function M.create_augroup(name, autocmds)
  cmd ('augroup ' .. name)
  cmd('autocmd!')

  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd ' .. table.concat(autocmd, ' '))
  end

  cmd('augroup END')
end

-- Add a apth to the rtp
function M.add_rtp(path)
  local rtp = vim.o.rtp
  rtp = rtp .. ',' .. path
end

-- Map a key with optional options
function M.map(mode, keys, action, options)
  if options == nil then
    options = {}
  end
  vim.api.nvim_set_keymap(mode, keys, action, options)
end

-- Unmap a key
function M.unmap(mode, keys)
  vim.api.nvim_del_keymap(mode, keys)
end

-- Map a key to a lua callback
function M.map_lua(mode, keys, action, options)
  if options == nil then
    options = {}
  end
  vim.api.nvim_set_keymap(mode, keys, "<cmd>lua " .. action .. "<cr>", options)
end

-- Buffer local mappings
function M.map_buf(mode, keys, action, options, buf_nr)
  if options == nil then
    options = {}
  end
  local buf = buf_nr or 0
  vim.api.nvim_buf_set_keymap(buf, mode, keys, action, options)
end

function M.map_lua_buf(mode, keys, action, options, buf_nr)
  if options == nil then
    options = {}
  end
  local buf = buf_nr or 0
  vim.api.nvim_buf_set_keymap(buf, mode, keys, "<cmd>lua " .. action .. "<cr>", options)
end

function M.echo(text)
  vim.api.nvim_echo({{text, 'None' }}, false, {})
end

function M.is_executable(command)
  local result = os.execute("command -v " .. command .. " >/dev/null 2>&1")
  return result
end

-- We want to be able to access utils in all our configuration files
-- so we add the module to the _G global variable.
-- _G.utils = M

return M -- Export the module
