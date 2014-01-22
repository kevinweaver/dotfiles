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
alias gitog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"




#Aliases
source $HOME/.zsh_aliases

# Plugins to load, loc in  ~/.oh-my-zsh/custom/plugins/ Ex: plugins=(rails git textmate ruby lighthouse)
plugins=(git github vundle rbenv ruby rails encode64 tmux)

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color
alias weechat='TERM=screen-256color weechat-curses'
if [ "$TMUX" = "" ]; then tmux; fi

# Default PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
# HOMEBREW / GVM / REVEL
export PATH=/usr/local/bin:$PATH:/usr/local/sbin:/opt

function chpwd() {
    emulate -L zsh
      ls -a
}
#rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# Load rvm into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

PATH=${PATH}:~/applications/android-sdk-linux/tools
PATH=${PATH}:~/applications/android-sdk-linux/platform-tools

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
