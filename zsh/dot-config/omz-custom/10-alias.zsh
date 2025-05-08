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
  alias ls="eza --icons=auto"
fi

if cmd_exists bat; then
  alias cat="bat"
fi

if cmd_exists yazi; then
  function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
  }
fi

if [ $TERM = "xterm-kitty" ]; then
  alias ksh="kitten ssh"
fi
