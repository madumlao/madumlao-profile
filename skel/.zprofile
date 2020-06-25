source /etc/profile
source $HOME/.profile

# source kubernetes shell completion
if [ "$PROFILE_ENABLE_KUBECTL" ]; then
  source <(kubectl completion zsh)
fi
