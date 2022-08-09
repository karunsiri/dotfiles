# dotfiles

## Requirements

- `zsh` as a default shell

      chsh -s $(which zsh)

- [Neovim](https://neovim.io/). A Better Vim

- Thoughtbot [rcm](https://github.com/thoughtbot/rcm) to manage dotfiles sync.

## Syncing dotfiles

- Clone this repo to `~/.dotfiles`

      git clone https://github.com/karunsiri/dotfiles.git ~/.dotfiles

- Sync the dotfiles

      RCRC=$HOME/.dotfiles/rcrc rcup

  You can run `rcup` over and over again without having to supply `RCRC` env.

# Customizations (TBD)

- `nvim`
- tmux
