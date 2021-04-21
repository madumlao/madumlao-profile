# bash profile
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

source "$HOME/.profile"

# source kubernetes shell completion
if type kubectl 2> /dev/null && [ "$PROFILE_ENABLE_KUBECTL" ]; then
  source <(kubectl completion bash)
fi
