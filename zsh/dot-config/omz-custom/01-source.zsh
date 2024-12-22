# DONOT CHANGE THE FILENAME
# MUST BE FIRSTLY SOURCED
config_dir="local"
for custom_config ("$ZSH_CUSTOM"/$config_dir/*.zsh(N)); do
  source "$custom_config"
done
unset custom_config

function cmd_exists() {
  which $1 > /dev/null 2>&1
}
