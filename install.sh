#!/usr/bin/env bash

exclude=(
  ".",
  "..",
  ".DS_Store",
  ".git",
  "install.sh",
  "README.md",
  "mamp.md",
  "keyremap-private.xml",
  "keyremap-user.xml",
  "vhost-setup.sh",
  "osx-env-sync.plist",
  ".brew"
)

PWD=`pwd`

for f in `ls -a`
do
  case "${exclude[@]}" in  *"$f"*) continue ;; esac
  ln -sfn $PWD/$f ~/$f
done

# Set up some commonly used aliases
sudo ln -sfn ~/Desktop /ds
sudo ln -sfn ~/Dropbox /db
sudo ln -sfn ~/Dropbox/www /www
sudo ln -sfn ~/Dropbox/tjb-dev /tjb-dev
sudo ln -sfn /Applications/MAMP/htdocs /mamp

# Set up some special config files
ln -sfn ~/dotfiles/.karabiner.json /Users/thomasjbradley/.config/karabiner/karabiner.json

# Sequel Pro favourites & settings
ln -sfn /db/Preferences/Sequel\ Pro/com.sequelpro.SequelPro.plist com.sequelpro.SequelPro.plist
ln -sfn /db/Preferences/Sequel\ Pro/Application\ Support/ Sequel\ Pro

# Fix some QLStephen preview problems
cp ./QLStephenExtensionsBlackList.plist /Users/thomasjbradley/Library/QuickLook/QLStephen.qlgenerator/Contents/Resources/
qlmanage -r

# Change login shell
# https://matt.sh/fix-os-x-terminal-launch-speed
chsh -s /usr/local/bin/bash

cp ./osx-env-sync.plist ~/Library/LaunchAgents/
