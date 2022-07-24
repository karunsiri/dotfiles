# Defining zplug home dir
if [[ -z $ZPLUG_HOME ]]; then
  export ZPLUG_HOME=~/.zplug
fi

InstallZplug() {
  if ! [ -d "$HOME/.zplug" ]; then
    echo 'Installing zplug, a Zsh plugin manager.'
    {
      git clone https://github.com/zplug/zplug.git $ZPLUG_HOME
      cd $ZPLUG_HOME
      git checkout "$(git describe --abbrev=0 --tags)"
      cd -
    } &> /dev/null
  fi
}

# Try loading zplug from home dir
InitZplug() {
  if [ -f "$HOME/.zplug/init.zsh" ]; then
    source "$HOME/.zplug/init.zsh"
  fi
}

UpdateAndLoadZshPlugins() {
  # zplug check returns true if all packages are installed
  # Therefore, when it returns false, run zplug install
  if ! zplug check; then
    zplug install
  fi

  # source plugins and add commands to the PATH
  zplug load
}

InstallZplug
InitZplug

# Tell zplug which plugin to load & use
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions",     defer:2

UpdateAndLoadZshPlugins

# Zsh plugin configurations
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
