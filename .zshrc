#oh-my-zsh
ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="kevin"

#ZSH_THEME="mh"
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# General Aliases
alias ll="ls -l"
alias la="ls -a"
alias deploy="~/scripts/deployment_scripts/main_deploy.sh"
alias sudo="nocorrect sudo"
alias gitlog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

source $HOME/.zsh_aliases

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l | grep "The agent has no identities" && ssh-add

#. $HOME/ssh-find-agent.sh
#ssh-find-agent -a
#if [ -z "$SSH_AUTH_SOCK" ]
#then
#   eval $(ssh-agent) > /dev/null
#   ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
#fi

# Plugins to load, loc in  ~/.oh-my-zsh/custom/plugins/ Ex: plugins=(rails git textmate ruby lighthouse)
plugins=(git github vundle rbenv ruby rails encode64 tmux)

source $ZSH/oh-my-zsh.sh

export TERM="xterm-256color"
alias weechat='TERM=screen-256color weechat-curses'
if [ "$TMUX" = "" ]; then tmux; fi

#PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
# HOMEBREW / GVM / REVEL
export PATH=/usr/local/bin:$PATH:/usr/local/sbin:/opt

function chpwd() {
    emulate -L zsh
      ls -a
}
#rvm
# Load rvm into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

PATH=${PATH}:~/applications/android-sdk-linux/tools
PATH=${PATH}:~/applications/android-sdk-linux/platform-tools

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/share/npm/bin/:$PATH"

export PATH="/usr/local/bin/:$PATH"

#export PATH=$PATH:"/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/mysql/bin:/opt/local/bin"
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$HOME/.node/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
