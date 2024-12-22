alias zshconfig="${EDITOR-"vim"} $HOME/.zshrc"

if cmd_exists nvim; then
  alias vim="nvim"
fi

if cmd_exists proxychains4; then
  alias pc="proxychains4 -q"
fi

if cmd_exists tmux; then
  alias tat="tmux attach"
fi

if cmd_exists eza; then
  alias ls="eza"
fi

if cmd_exists bat; then
  alias cat="bat"
  export BAT_THEME="Catppuccin Mocha"
fi

if [ $TERM = "xterm-kitty" ]; then
  alias ksh="kitten ssh"
fi
