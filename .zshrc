#oh-my-zsh
ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="kevin"

#ZSH_THEME="mh"
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
# Plugins to load, loc in  ~/.oh-my-zsh/custom/plugins/ Ex: plugins=(rails git textmate ruby lighthouse)
plugins=(github vundle rbenv ruby rails encode64 tmux)

source $HOME/.zsh_aliases
source $HOME/.zsh_profile
source $HOME/.zsh_env
source $HOME/.work_scripts
source $HOME/.work_aliases

#ZSH Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# SSH Agent
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l | grep "The agent has no identities" && ssh-add

source $ZSH/oh-my-zsh.sh

# Colors
export TERM="xterm-256color"
alias weechat='TERM=screen-256color weechat-curses'

#Tmux
#if [ "$TMUX" = "" ]; then tmux new; fi

#rvm
# Load rvm into a shell session *as a function*
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR=/usr/bin/vim
export BUNDLE_EDITOR=/usr/bin/vim

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

export PATH=/usr/local/share/npm/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/kevinweaver/.sdkman"
[[ -s "/Users/kevinweaver/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/kevinweaver/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="~/.nvm"
source ~/.nvm/nvm.sh
