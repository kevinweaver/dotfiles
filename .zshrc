#oh-my-zsh
ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="kevin"

ZSH_THEME="mh"
# Aliases
alias caffeine="echo 'No Sleep For an HOUR!'; caffeinate -u -t 3600"
alias ll="ls -l"
alias la="ls -a"
alias deploy="~/scripts/deployment_scripts/main_deploy.sh"
alias sudo="nocorrect sudo"


#Aliases
source $HOME/.zsh_aliases

# Plugins to load, loc in  ~/.oh-my-zsh/custom/plugins/ Ex: plugins=(rails git textmate ruby lighthouse)
plugins=(git github vundle rbenv ruby rails rails3 encode64 tmux)

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color
alias irssi='TERM=screen-256color irssi'
if [ "$TMUX" = "" ]; then tmux; fi

# Default PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
# HOMEBREW / GVM / REVEL
export PATH=/usr/local/bin:$PATH:/usr/local/sbin

function chpwd() {
    emulate -L zsh
      ls -a
}
#rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# Load rvm into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 


