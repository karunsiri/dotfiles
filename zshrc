export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export XDG_CONFIG_HOME=$HOME/.config
export NVIM_TUI_ENABLE_TRUE_COLOR=1

mkdir -p $XDG_CONFIG_HOME

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*~*.zwc(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/(pre|post)/*|*.zwc)
          :
          ;;
        *)
          . $config
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*~*.zwc(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

COLOR_RED='\[\e[1;31m\]'
COLOR_GREEN='\[\e[32m\]'
COLOR_YELLOW='\[\e[33m\]'
COLOR_BLUE='\[\e[34m\]'
COLOR_BLACK='\[\e[0m\]'
GIT_PS1_SHOWUPSTREAM="auto"

# Store last 4096 commands, for fzf's sake
export HISTSIZE=4096

# fzf options
export FZF_DEFAULT_OPTS='--no-height --no-reverse'
export BAT_THEME=GitHub
export FZF_DEFAULT_OPTS="--bind=ctrl-alt-k:preview-up,ctrl-alt-j:preview-down --preview-window=border-thinblock --color=border:248,preview-bg:253"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :60 {}' --scrollbar=▏▕ "

# Install Terraform autocomplete if terraform is available
if command -v terraform > /dev/null 2>&1; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C $(which terraform) terraform
fi

# Init FZF key bindings & shell completion
if [ -x "$(command -v fzf)" ]; then
  if [ -f "/usr/share/fzf/shell/key-bindings.zsh" ]; then
    source /usr/share/fzf/shell/key-bindings.zsh
  elif [ -f "/etc/zsh_completion.d/fzf-key-bindings" ]; then
    source /etc/zsh_completion.d/fzf-key-bindings
  fi
fi

# Load Zsh plugin manager and install plugins
[ -f ~/.addons/zsh-plugins.zsh ] && source ~/.addons/zsh-plugins.zsh

# Initiate Neovim configs
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

export PATH="$HOME/.local/bin:$PATH"

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Set GOROOT
[[ -f ~/.asdf/plugins/golang/set-env.zsh ]] && source ~/.asdf/plugins/golang/set-env.zsh
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
