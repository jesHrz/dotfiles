alias zshconfig="vim $HOME/.zshrc"

if which nvim > /dev/null 2>&1; then
  alias vim="nvim"
fi

if which proxychains4 > /dev/null 2>&1; then
  alias pc="proxychains4 -q"
fi

if which tmux > /dev/null 2>&1; then
  alias tat="tmux attach"
fi

if which eza > /dev/null 2>&1; then
  alias ls="eza"
fi

if which bat > /dev/null 2>&1; then
  alias cat="bat"
  export BAT_THEME="Catppuccin Mocha"
fi

if [ $TERM = "xterm-kitty" ]; then
  alias ksh="kitten ssh"
fi
