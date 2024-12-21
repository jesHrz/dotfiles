# DONOT CHANGE THE FILENAME
# MUST BE FIRSTLY SOURCED
config_dir="local"
for custom_config ("$ZSH_CUSTOM"/$config_dir/*.zsh(N)); do
  source "$custom_config"
done
unset custom_config
