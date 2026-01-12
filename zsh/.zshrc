# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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


##scripts
#getlogs script
source $HOME/project/scripts/get_logs
source $HOME/project/scripts/get_versions


#enable startship https://starship.rs
#go to g202

########## plugins
plugins=(
git
kubectl
aws
zsh-syntax-highlighting
)

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

################################ aliases
alias zshconfig="nvim ~/.zshrc"
#alias ohmyzsh="nvim ~/.oh-my-zsh"
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

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"
