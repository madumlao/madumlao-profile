#!/bin/bash
if ! [ -t 0 ]; then
  echo "exec from pipe"
  DOWNLOAD_APP=y
  APP_DIR="$HOME/.local/share/madumlao-profile"
else
  DOWNLOAD_APP=
  APP_DIR="$(dirname "$0")"
fi

echo "Run an apt update"
if sudo -l apt; then
  sudo apt update
else
  echo "Unable to run apt commands, please install manually"
fi

echo "Install git and friends"
if sudo -l apt; then
  sudo apt install git
else
  echo "Unable to autoinstall git and friends, please install manually"
fi

if [ "$DOWNLOAD_APP" ]; then
  echo "Downloading master copy"
  mkdir -pv "$APP_DIR"
  git clone https://github.com/madumlao/madumlao-profile "$APP_DIR"
fi

echo "Set pwd to $APP_DIR"
cd "$APP_DIR"
APP_DIR="$(pwd)"

echo "Install zsh and friends"
if sudo -l apt; then
  sudo apt install zsh command-not-found
else
  echo "Unable to autoinstall zsh and friends, please install manually"
fi

echo "Install oh-my-zsh and plugins"
if ! [ -d "$HOME/.oh-my-zsh" ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh "$HOME/.oh-my-zsh"
fi

(
  cd "$HOME/.oh-my-zsh/plugins"
  git clone https://github.com/zsh-users/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting
)

echo "Changing default shell"
ZSH_PATH="$(which zsh)"
if [ -x "$ZSH_PATH" ]; then
  if sudo -l chsh -s $ZSH_PATH $USER; then
    sudo chsh -s $ZSH_PATH $USER
  elif sudo -l usermod -s $ZSH_PATH $USER; then
    sudo usermod -s $ZSH_PATH $USER
  else
    echo "Cannot change shell using sudo, trying password"
    if ! chsh -s "$ZSH_PATH"; then
      echo "Unable to change shell to $ZSH_PATH, please change shell manually"
    fi
  fi
else
  echo "No zsh available"
fi

SKEL_DIR="$APP_DIR/skel"
BACK_DIR="$APP_DIR/backup"

echo "Backing up original profile under $BACK_DIR"
mkdir -pv "$BACK_DIR"

cd "$SKEL_DIR"
OLDIFS="$IFS"
IFS=$'\n'
for x in $(ls -a); do
  [ "$x" = '.' ] || [ "$x" = '..' ] && continue;
  [ "$x" = '.profile-local' ] || [ "$x" = '.profile-private' ] && continue;
  [ -r "$HOME/$x" ] && echo -ne "Backup: " && mv -v "$HOME/$x" "$BACK_DIR"
  echo -ne "Linking: " && ln -srv "$(pwd)/$x" "$HOME"
done
IFS="$OLDIFS"

echo "Install vim-nox and friends"
if sudo -l apt; then
  sudo apt install vim-nox
else
  echo "Unable to autoinstall vim-nox and friends, please install manually"
fi
mkdir -pv "$HOME/.vim/bundle"
git clone https://github.com/VundleVim/Vundle.vim "$HOME/.vim/bundle/Vundle.vim"
vim +PluginInstall +qall

echo "Set vim-nox as the default system editor"
VIM_PATH="$(which vim.nox)"
if [ -x "$VIM_PATH" ]; then
  sudo update-alternatives --set editor "$VIM_PATH"
fi
