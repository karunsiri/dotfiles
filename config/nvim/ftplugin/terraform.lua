-- Format terraform script on save
vim.g.terraform_fmt_on_save = 1

local utils = require('utils')
local map = utils.map
local bmap = utils.map_buf
local opts = { noremap = true, silent = true, buffer = 0 }

function open_aws_doc(doc_type)
  local url = 'https://registry.terraform.io/providers/'..
              'hashicorp/aws/latest/docs/'..doc_type.."/%s"
  -- aws_vpc -> vpc
  local resource_name = string.gsub(vim.fn.expand('<cword>'), 'aws_', '')
  local dest = string.format(url, resource_name)
  local cmd = [[
    exec "!open %s"
    :redraw!
  ]]

  vim.cmd(string.format(cmd, dest))
end

function open_resource_doc()
  open_aws_doc('resources')
end

function open_data_doc()
  open_aws_doc('data-sources')
end

-- 'gr' to open AWS resource doc
vim.keymap.set('n', 'GR', open_resource_doc, opts)

-- 'gd' to open AWS data doc
vim.keymap.set('n', 'GD', open_data_doc, opts)
