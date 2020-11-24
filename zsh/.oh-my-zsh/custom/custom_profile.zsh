alias zshconfig="vim ~/.oh-my-zsh/custom/custom_profile.zsh"
alias code=\''/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code'\'

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home
export NODE_HOME=/usr/local/Cellar/node/8.12.0

PATH=$PATH:$NODE_HOME/bin:/usr/local/bin
PATH=$PATH:/usr/local/opt/riscv-gnu-toolchain/bin

# For pkg-config to find opencv@3
export PKG_CONFIG_PATH="/usr/local/opt/opencv@3/lib/pkgconfig"

alias setproxy="export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;export all_proxy=socks5://127.0.0.1:1086; echo 'set proxy'"
alias unsetproxy="unset http_proxy; unset https_proxy; unset all_proxy; echo 'unset proxy'"
# query IP
alias ip="curl myip.ipip.net"

# USTC homebrew bottle binary source
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

eval $(thefuck --alias)
