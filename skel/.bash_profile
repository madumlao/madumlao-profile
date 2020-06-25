# bash profile
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

source "$HOME/.profile"

# source kubernetes shell completion
if [ "$PROFILE_ENABLE_KUBECTL" ]; then
  source <(kubectl completion bash)
fi
