source /etc/profile
source $HOME/.profile

# source kubernetes shell completion
if whence kubectl > /dev/null && [ "$PROFILE_ENABLE_KUBECTL" ]; then
  source <(kubectl completion zsh)
fi
