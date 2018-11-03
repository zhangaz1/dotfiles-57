autoload -Uz colors

# init colors
colors

# grep
export GREP_COLOR=34

# dircolors
if [ -f ~/.dircolors ]; then
  eval $(dircolors -b ~/.dircolors)
fi

# grc for commands
if hash grc 2> /dev/null; then
  alias colourify="grc -es --colour=auto"

  alias diff="colourify diff"
  alias make="colourify make"
  alias gcc="colourify gcc"
  alias g++="colourify g++"
  alias ld="colourify ld"
  alias netstat="colourify netstat"
  alias ping="colourify ping"
  alias traceroute="colourify traceroute"
fi

# base16 for shell colors
if [ -d ~/.zsh/plugins/base16-shell/ ]; then
  export BASE16_SHELL=~/.zsh/plugins/base16-shell/

  base16() {
    pushd $BASE16_SHELL/scripts > /dev/null

    local theme=$(find . | sed -e 's/\.\/base16\-//g' | cut -d '.' -f1 | sort | fzf --reverse --no-sort --prompt='base16 > ')

    if [ ! -z $theme ]; then
      local filename="base16-$theme.sh"

      echo "switching theme to: $theme"

      rm ~/.base16_theme > /dev/null
      ln -s $BASE16_SHELL/scripts/$filename ~/.base16_theme

      base16-load
    fi

    popd > /dev/null
  }

  base16-load() {
    source ~/.base16_theme

    export BASE16_THEME="$(basename $(realpath ~/.base16_theme))"

    if [ ! -z $TMUX ]; then
      tmux set-environment -g BASE16_THEME "$BASE16_THEME"
    fi
  }

  # source only if we don't have BASE16_THEME set
  if [ -f ~/.base16_theme ]; then
    local CURRENT_BASE16_THEME="$(basename $(realpath ~/.base16_theme))"

    if [ -z $BASE16_THEME ] || [ $CURRENT_BASE16_THEME != $BASE16_THEME ]; then
      base16-load
    fi
  fi
fi

