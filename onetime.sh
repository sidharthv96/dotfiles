#!/usr/bin/env bash

./brew.sh 

mkdir ~/.nvm

touch ~/.secrets

sh -c "$(curl -fs SL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash


git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

git clone https://github.com/jimeh/zsh-peco-history $ZSH_CUSTOM/plugins/zsh-peco-history
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/johanhaleby/kubetail $ZSH_CUSTOM/plugins/kubetail

# Make sure Keybase FS is enabled
gpg --import /Volumes/Keybase/private/sidharthv/gpg.key

# Add VPN Password to Keychain
/usr/bin/security add-generic-password -a Oracle_AnyConnect_VPN -s Oracle_AnyConnect_VPN -U -w