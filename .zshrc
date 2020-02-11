export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"
# HIST_STAMPS="mm/dd/yyyy"
plugins=(git kubetail z zsh-autosuggestions npm vscode web-search httpie kubectl)

source $ZSH/oh-my-zsh.sh

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

# K8s aliases
alias k='kubectl'
alias kgp='k get pods'
alias kga='k get all'
alias kd='k describe'
alias kl='k logs'
alias klf='kl -f'
function kt(){
    kubetail "$1" -k pod
}
function kx(){
    k exec -it $1 sh
}
function krd(){
    #Restarts a deployment
    kubectl patch deployment $1 -p \
  "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"date\":\"`date +'%s'`\"}}}}}"
}

alias lKube='pOff; kubectx local; export TILLER_NAMESPACE=helios;kgp'
alias iKube='pOn; kubectx integ; kubens helios-ci; export TILLER_NAMESPACE=helios-ci;kgp'
alias sKube='pOn; kubectx integ; kubens helios-sidv; export TILLER_NAMESPACE=helios-sidv;kgp'
alias stKube='pOn; kubectx stage; kubens helios-ci; export TILLER_NAMESPACE=helios-ci;kgp'

alias ksql='docker exec -it $(docker ps -qf "name=ksql-cli") ksql http://ksql-service:8088'
alias kksql='k exec -it ksql-cli ksql http://ksql-service:8088'


alias grun='./gradlew run'
alias gw='./gradlew'

alias erc='code ~/.zshrc'
alias src='source ~/.zshrc'

alias helios='itermocil helios'

alias pm='python manage.py'
alias serve='python3 -m http.server'

alias ls='ls -la'

# Dirty hack around McAfee 
alias brew='sudo chown -R $(whoami) /usr/local/bin /usr/local/lib; chmod u+w /usr/local/bin /usr/local/lib; brew'

alias curl='http'

export TILLER_NAMESPACE=webhook
export HELIOS_ENV=local
export KUBETAIL_SINCE=10m
export HOMEBREW_BUNDLE_FILE=/Users/sidv/Brewfile

export NODE_ENV=development
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/bin:/usr/local/opt/ruby/bin:$PATH"

eval "$(direnv hook zsh)"
