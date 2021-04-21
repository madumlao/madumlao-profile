#!/bin/bash
APP_DIR="$(dirname "$0")"
cd "$APP_DIR"
APP_DIR="$(pwd)"

echo "Install zsh and friends"
sudo apt install zsh command-not-found

echo "Install oh-my-zsh and plugins"
if ! [ -d .oh-my-zsh ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh "$HOME/.oh-my-zsh"
fi

(
  cd "$HOME/.oh-my-zsh/plugins"
  git clone https://github.com/zsh-users/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting
)

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

echo "Install vim and friends"
sudo apt install vim-nox git
mkdir -pv "$HOME/.vim/bundle"
git clone https://github.com/VundleVim/Vundle "$HOME/.vim/bundle/Vundle.vim"
vim +PluginInstall +qall
