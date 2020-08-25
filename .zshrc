#!/usr/bin/env bash
export ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"
source "$HOME/.zprofile"
source "$HOME/.secrets"
export ZSH_THEME="spaceship"
# HIST_STAMPS="mm/dd/yyyy"
plugins=(git kubetail z colored-man-pages zsh-autosuggestions npm vscode web-search safe-paste zsh-peco-history)

HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_ALL_DUPS 

source $ZSH/oh-my-zsh.sh
setopt autocd

ssh-add ~/.ssh/id_rsa &>/dev/null
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,work,iterm2_shell_integration}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

unalias gr

###-tns-completion-start-###
if [ -f /Users/sidv/.tnsrc ]; then 
    source /Users/sidv/.tnsrc 
fi
###-tns-completion-end-###