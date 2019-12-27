#!/bin/bash

export all_proxy=http://www-proxy-idc.in.oracle.com:80;
export http_proxy=http://www-proxy-idc.in.oracle.com:80;
export https_proxy=http://www-proxy-idc.in.oracle.com:80;
export ALL_PROXY=http://www-proxy-idc.in.oracle.com:80;
export HTTP_PROXY=http://www-proxy-idc.in.oracle.com:80;
export HTTPS_PROXY=http://www-proxy-idc.in.oracle.com:80;
export ftp_proxy=http://www-proxy-idc.in.oracle.com:80;
export FTP_PROXY=http://www-proxy-idc.in.oracle.com:80; 

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd ~
git clone https://github.com/sidharthv96/dotfiles.git
cp dotfiles/* ./

brew bundle
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
