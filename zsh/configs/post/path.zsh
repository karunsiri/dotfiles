# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:$PATH:/usr/local/sbin"

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

# Ensure mise shims are available, but only if mise is installed
if [[ -d "$HOME/.local/share/mise/shims" ]]; then
  PATH="$PATH:$HOME/.local/share/mise/shims"
fi

export -U PATH
