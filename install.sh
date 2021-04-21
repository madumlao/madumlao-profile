#!/bin/bash
APP_DIR="$(dirname "$0")"
cd "$APP_DIR"
APP_DIR="$(pwd)"

echo "Install zsh and friends"
if sudo -l apt; then
  sudo apt install zsh command-not-found
else
  echo "Unable to autoinstall zsh and friends, please install manually"
fi

echo "Install oh-my-zsh and plugins"
if ! [ -d .oh-my-zsh ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh "$HOME/.oh-my-zsh"
fi

(
  cd "$HOME/.oh-my-zsh/plugins"
  git clone https://github.com/zsh-users/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting
)

echo "Changing default shell"
ZSH_PATH="$(which zsh)"
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

SKEL_DIR="$APP_DIR/skel"
BACK_DIR="$APP_DIR/backup"

echo "Backing up original profile under $BACK_DIR"
mkdir -pv "$BACK_DIR"

cd "$SKEL_DIR"
OLDIFS="$IFS"
IFS=$'\n'
for x in $(ls -a); do
  [ "$x" = '.' ] || [ "$x" = '..' ] && continue;
  [ -r "$HOME/$x" ] && echo -ne "Backup: " && mv -v "$HOME/$x" "$BACK_DIR"
  echo -ne "Linking: " && ln -srv "$(pwd)/$x" "$HOME"
done
IFS="$OLDIFS"

echo "Install vim-nox and friends"
if sudo -l apt; then
  sudo apt install vim-nox git
else
  echo "Unable to autoinstall vim-nox and friends, please install manually"
fi
mkdir -pv "$HOME/.vim/bundle"
git clone https://github.com/VundleVim/Vundle.vim "$HOME/.vim/bundle/Vundle.vim"
vim +PluginInstall +qall
