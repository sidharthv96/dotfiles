# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/sidv/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubetail z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ssh-add ~/.ssh/id_rsa &>/dev/null
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias gp='git pull'

alias pOn="""
    export all_proxy=http://www-proxy-idc.in.oracle.com:80;
    export http_proxy=http://www-proxy-idc.in.oracle.com:80;
    export https_proxy=http://www-proxy-idc.in.oracle.com:80;
    export ALL_PROXY=http://www-proxy-idc.in.oracle.com:80;
    export HTTP_PROXY=http://www-proxy-idc.in.oracle.com:80;
    export HTTPS_PROXY=http://www-proxy-idc.in.oracle.com:80;
    export ftp_proxy=http://www-proxy-idc.in.oracle.com:80;
    export FTP_PROXY=http://www-proxy-idc.in.oracle.com:80;
    export no_proxy=.consul.lan,.us.oracle.com,.oraclecorp.com,localhost,localhost.localdomain,192.168.99.*,192.168.99.104,192.168.99.100,us.oracle.com,*.internal;
    export NO_PROXY=.consul.lan,.us.oracle.com,.oraclecorp.com,localhost,localhost.localdomain,192.168.99.*,192.168.99.104,192.168.99.100,us.oracle.com,*.internal;
"""
alias pOff="""
    unset all_proxy
    unset http_proxy
    unset https_proxy
    unset ALL_PROXY
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset ftp_proxy
    unset FTP_PROXY
    unset NO_PROXY
    unset no_proxy
"""
alias lKube='pOff; kubectx local; export TILLER_NAMESPACE=helios'
alias iKube='pOn; kubectx integ; kubens helios-ci; export TILLER_NAMESPACE=helios-ci;'
alias sKube='pOn; kubectx integ; kubens helios-sidv; export TILLER_NAMESPACE=helios-sidv;'
alias stKube='pOn; kubectx stage; kubens helios-ci; export TILLER_NAMESPACE=helios-ci;'
# alias stKube='proxyOn; rm ~/.kube/config; cp ~/.kube/osvcstageiad-config ~/.kube/config; export TILLER_NAMESPACE=helios-ci; kubens helios-ci'
alias k='kubectl'
alias kgp='k get pods'
alias kga='k get all'
alias kd='k describe'
alias kl='k logs'
alias klf='kl -f'
alias kt='kubetail'
alias ksql='docker exec -it $(docker ps -qf "name=ksql-cli") ksql http://ksql-service:8088'
alias kksql='k exec -it ksql-cli ksql http://ksql-service:8088'
function kx(){
    k exec -it $1 sh
}
function krd(){
    #Restarts a deployment
    kubectl patch deployment $1 -p \
  "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"date\":\"`date +'%s'`\"}}}}}"
}


alias grun='./gradlew run'
alias gw='./gradlew'
alias erc='code ~/.zshrc'
alias src='source ~/.zshrc'
alias pm='python manage.py'
alias serve='python3 -m http.server'
alias helios='itermocil helios'
alias ls='ls -la'
alias brew='sudo chown -R $(whoami) /usr/local/bin /usr/local/lib; chmod u+w /usr/local/bin /usr/local/lib; brew'

export TILLER_NAMESPACE=webhook
export NODE_ENV=development
export HELIOS_ENV=local
export KUBETAIL_SINCE=10m
export HOMEBREW_BUNDLE_FILE=/Users/sidv/Brewfile
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/Users/sidv/bin:/usr/local/opt/ruby/bin:$PATH"

eval "$(direnv hook zsh)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
