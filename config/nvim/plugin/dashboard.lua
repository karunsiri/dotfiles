local ok, db = pcall(require, 'dashboard')
if not ok then
  return
end

local tree_api = require('nvim-tree.api')

local dashboard_custom_header = {
  "",
  "                                        ",
  "                                        ",
  "                                        ",
  "                                        ",
  "                                        ",
  "                                        ",
  "          ▓▓▓  ▓▓▓▓        ▒▓▓▓         ",
  "           ▓▓▓  ▓▓▓▓      ▓▓▓▓          ",
  "             ▓▓▓  ▓▓▓▓  ▓▓▓▓            ",
  "               ▓▓  ▓▓▓▓▓▓▓▓             ",
  "                ▓▓▓  ▓▓▓▓               ",
  "              ▓▓▓  ▓▓▓▓▓▓▓▓             ",
  "             ▓▓▓ ░▓▓▓░   ▓▓▓▒           ",
  "           ▓▓▓  ▓▓▓▓      ▓▓▓▓          ",
  "         ▓▓▓  ▓▓▓▓          ▓▓▓▓        ",
  "                                        ",
  "                                        ",
  "                                        ",
  "                                        ",
  "                                        ",
  ""
}

local dashboard_custom_header = {
  "████████████████████████████████████████",
  "████████████████████████████████████████",
  "████████████████████████████████████████",
  "████████████████████████████████████████",
  "████████████████████████████████████████",
  "██████████▀▀▀██▀▀▀▀████████▀▀▀▀█████████",
  "███████████▄  ▀█    █████▀   ▄██████████",
  "█████████████  ▀██   ▀█▀   ▄████████████",
  "██████████████▄  ▀█▄     ▄██████████████",
  "███████████████  ▄█▀     ▀██████████████",
  "█████████████▀  ██▀   █▄   ▀████████████",
  "███████████▀  ▄█▀   █████▄   ▀██████████",
  "█████████▀  ▄█▀   ▄████████▄   █████████",
  "████████████████████████████████████████",
  "████████████████████████████████████████",
  "████████████████████████████████████████",
  "████████████████████████████████████████",
  "████████████████████████████████████████",
  "",
}
db.custom_header = dashboard_custom_header

function open_project(folder)
  return function()
    local home = os.getenv('HOME')
    tree_api.tree.open()
    tree_api.tree.change_root(home.."/projects/"..folder)
  end
end

db.custom_center = {
  {
    icon = '🍹 ',
    desc = 'Open Verumex                 ',
    shortcut = '',
    action = open_project('verumex'),
  },
  {
    icon = ' ',
    desc = 'Open core-infrastructure    ',
    shortcut = '',
    action = open_project('core-infrastructure'),
  },
  {
    icon = '🚧 ',
    desc = 'Open new Core Platform Infra',
    shortcut = '',
    action = open_project('core-platform-infrastructure'),
  },
  {
    icon = '💻 ',
    desc = 'Open dotfiles                ',
    shortcut = '',
    action = open_project('../.dotfiles'),
  },
}
