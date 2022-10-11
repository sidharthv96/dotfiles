#!/usr/bin/env bash
# zmodload zsh/zprof
export ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh"
#source "$HOME/.zprofile"
source "$HOME/.secrets"
# HIST_STAMPS="mm/dd/yyyy"
plugins=(git z zsh-autosuggestions npm vscode web-search safe-paste zsh-peco-history) # kubetail

HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_ALL_DUPS 

source $ZSH/oh-my-zsh.sh
setopt autocd

ssh-add ~/.ssh/id_rsa &>/dev/null
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,work,iterm2_shell_integration}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

unalias gr

eval $(/opt/homebrew/bin/brew shellenv)

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

###-tns-completion-start-###
if [ -f /Users/sidv/.tnsrc ]; then 
    source /Users/sidv/.tnsrc 
fi
###-tns-completion-end-###
# zprof
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sidv/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sidv/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sidv/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sidv/bin/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"
# eval "$(rbenv init -)"
