export EDITOR="vim"
alias code="'/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code'"

alias zshconfig="$EDITOR ~/.oh-my-zsh/custom/custom_profile.zsh"
alias zshrc="source ~/.zshrc"
# alias vim="nvim"

export NODE_HOME="/usr/local/node-v14.17.6-darwin-x64"
export NODE_PATH="$NODE_HOME:$NODE_HOME/lib/node_modules"
export QEMU_PATH="/Users/jeshrz/Projects/qemu-4.1.0/build/bin"
export PATH="/usr/local/Cellar/llvm/12.0.0_1/bin/:/usr/local/opt/:$NODE_HOME/bin:$QEMU_PATH:$PATH"
export PATH="/usr/local/opt/binutils/bin:$PATH"

# export PATH="/opt/gcc-arm-none-eabi-10-2020-q4-major/bin/:$PATH"
alias openpd="sudo -b /Applications/Parallels\ Desktop.app/Contents/MacOS/prl_client_app"
alias pc="proxychains4 -q"

alias setproxy="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890;echo 'set proxy'"
alias unsetproxy="unset all_proxy https_proxy http_proxy;echo 'unset proxy'"
# query IP
alias ip="curl myip.ipip.net"

# export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
# export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BOTTLE_DOMAIN=""

eval $(thefuck --alias)


# alias oocd="/usr/local/Cellar/open-ocd/0.10.0/bin/openocd -f /usr/local/Cellar/open-ocd/0.10.0/share/openocd/scripts/interface/stlink-v2-1.cfg -f /usr/local/Cellar/open-ocd/0.10.0/share/openocd/scripts/target/stm32f7x.cfg"
