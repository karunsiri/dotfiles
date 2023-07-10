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
  "",
  "████████████████████████████████████",
  "████████████████████████████████████",
  "████████████████████████████████████",
  "████████████████████████████████████",
  "████████▀▀▀██▀▀▀▀████████▀▀▀▀███████",
  "█████████▄  ▀█    █████▀   ▄████████",
  "███████████  ▀██   ▀█▀   ▄██████████",
  "████████████▄  ▀█▄     ▄████████████",
  "█████████████  ▄█▀     ▀████████████",
  "███████████▀  ██▀   █▄   ▀██████████",
  "█████████▀  ▄█▀   █████▄   ▀████████",
  "███████▀  ▄█▀   ▄████████▄   ███████",
  "████████████████████████████████████",
  "████████████████████████████████████",
  "████████████████████████████████████",
  "████████████████████████████████████",
  "",
}

function open_project(folder)
  return function()
    local home = os.getenv('HOME')
    tree_api.tree.open()
    tree_api.tree.change_root(home.."/projects/"..folder)
  end
end

db.setup({
  theme = 'hyper',
  config = {
    packages = { enable = false },
    header = dashboard_custom_header,
    mru = { limit = 5 },
    project = { limit = 5, action = 'e ' },
    shortcut = {
      { desc = 'Verumex', group = '@property', key = 'v', action = 'e ~/projects/verumex' },
      { desc = 'Infra', group = 'DiagnosticHint', key = 'i', action = 'e ~/projects/core-platform-infrastructure' },
      { desc = ' dotfiles', group = 'DashboardShortCut', key = 'd', action = 'e ~/.dotfiles' },
      { desc = ' Update', group = 'DashboardShortCut', key = 'u', action = 'Lazy' },
    },
  }
})
