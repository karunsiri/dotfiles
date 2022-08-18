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

[ -f ~/.bash_customs ] && source ~/.bash_customs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load Zsh plugin manager and install plugins
[ -f ~/.addons/zsh-plugins.zsh ] && source ~/.addons/zsh-plugins.zsh

# Initiate Neovim configs
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

export PATH="$HOME/.local/bin:$PATH"
