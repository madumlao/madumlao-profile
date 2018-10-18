#!/bin/bash
APP_DIR="$(dirname "$0")"
cd "$APP_DIR"
APP_DIR="$(pwd)"

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
