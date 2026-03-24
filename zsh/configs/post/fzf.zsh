#!/usr/bin/env zsh

# fzf options
export BAT_THEME=GitHub
export FZF_DEFAULT_OPTS="--bind=ctrl-alt-k:preview-up,ctrl-alt-j:preview-down --preview-window=border-thinblock --color=border:248,preview-bg:253"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :60 {}' --scrollbar=▏▕ "

# Init FZF key bindings & shell completion
if command -v fzf > /dev/null; then
  source <(fzf --zsh)
elif [[ -x ~/.fzf/bin/fzf ]]; then
  source <(~/.fzf/bin/fzf --zsh)
fi
