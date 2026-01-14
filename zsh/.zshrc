
## cashe autocomplite
autoload -Uz compinit
compinit -C -u

#postgresql
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"

## editor
export KUBE_EDITOR="nvim"
export EDITOR="nvim"

#p
export PATH="~/.local/bin:$PATH"

## kube
#export KUBECONFIG=/home/dbibikov/.kube/configs_d/rtng-test.yaml.conf:/home/dbibikov/.kube/configs_d/common-test01.yaml.conf:
export KUBECONFIG=$HOME/.kube/configs_d/rtng-test.yaml.conf:$HOME/.kube/configs_d/common-test01.yaml.conf:

## k9s
export K9S_CONFIG_DIR=$HOME/.config/k9s

# fix default docker sock
export DOCKER_CONTEXT=colima

##scripts
#getlogs script
source $HOME/project/scripts/get_logs
source $HOME/project/scripts/get_versions


################################ aliases
alias zshconfig="nvim ~/.zshrc"
alias -g xcopy='xclip -selection clipboard'
alias -g xpaste='xclip -selection clipboard -o'
alias xcopy='pbcopy'
alias xpaste='pbpaste'
alias lvim='NVIM_APPNAME=lazyvim nvim' # LazyVim

#alias bat='batcat'
alias fzfb='fzf --preview "bat --color=always --style=numbers {}"'
alias prv='fzf --preview "bat --color=always --style=numbers {}"'
alias vi='nvim'
alias viprv='nvim $(prv)'

#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias py3='python3'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# enable starship
eval "$(starship init zsh)"

# fzf
source <(fzf --zsh)

# zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# NVM
export NVM_DIR="$HOME/.nvm"

nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm "$@"
}

node() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    node "$@"
}

npm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npm "$@"
}

npx() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npx "$@"
}



