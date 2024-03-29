#!/usr/bin/env bash

# ./brew.sh 

touch ~/.secrets
brew install wget
softwareupdate --install-rosetta

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

git clone https://github.com/jimeh/zsh-peco-history $ZSH_CUSTOM/plugins/zsh-peco-history
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/johanhaleby/kubetail $ZSH_CUSTOM/plugins/kubetail

wget "https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip"
unzip SpoonInstall.spoon.zip
rm SpoonInstall.spoon.zip
mv SpoonInstall.spoon ~/.hammerspoon/Spoons/

# Make sure Keybase FS is enabled
# gpg --import /Volumes/Keybase/private/sidharthv/gpg.key

# Add VPN Password to Keychain
# /usr/bin/security add-generic-password -a Oracle_AnyConnect_VPN -s Oracle_AnyConnect_VPN -U -w

# Reinstall vscode extensions
# xargs -n1 code --install-extension < vscode.md

# Set permissions for ~/.gnupg
mkdir -p ~/.gnupg
chown -R $(whoami) ~/.gnupg/

find ~/.gnupg -type f -exec chmod 600 {} \;
find ~/.gnupg -type d -exec chmod 700 {} \;