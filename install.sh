# README
# Use to set up a new machine with all my fancy things

######################
# Install Z Shell
######################
terminal(){
  cd ~
  echo "Installing curl and wget... \n"
  sleep 2
  sudo apt-get install curl libc6 libcurl3 zlib1g wget
  echo "Installing tmux... \n"
  sleep 2
  sudo apt-get install tmux
  echo "Installing oh-my-zsh... \n"
  sleep 2
  curl -L http://install.ohmyz.sh | sh
}

######################
# Install SQL Langs
######################
lamp(){
  sudo apt-get update
  echo "Installing Apache... \n"
  sleep 2
  sudo apt-get install apache2
  echo "Installing MySQL \n"
  sleep 2
  sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
  echo "Installing SqLite \n"
  sleep 2
  sudo apt-get install sqlite3 libsqlite3-dev
  echo "Installing PHP \n"
  sleep 2
  sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
  sudo /etc/init.d/apache2 restart
}

######################
# Install Python
######################
python(){
  echo "Installing Python... \n"
  sleep 2
  sudo add-apt-repository ppa:fkrull/deadsnakes
  sudo apt-get update
  sudo apt-get install python2.7

  curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | sudo python2.7
}

######################
# Install Node
######################
node(){
  echo "Installing Node... \n"
  sleep 2
  sudo add-apt-repository ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get install nodejs
}

######################
# Powerline
######################
powerline(){
  echo "Installing Powerline... \n"
  sleep 2
  sudo apt-get install python-pip # <--- Might not need this
  pip install -U pip
  pip install --user git+git://github.com/Lokaltog/powerline
  cd ~
  wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
  mv PowerlineSymbols.otf ~/.local/share/fonts/
  sudo fc-cache -f -v
  wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
 
  # Create a per-user fontconfig folder if it doesn't already exist
  mkdir -p ~/.config/fontconfig/fonts.conf
  mv 10-powerline-symbols.conf ~/.config/fontconfig/fonts.conf/
  wget https://raw.githubusercontent.com/Lokaltog/powerline-fonts/master/SourceCodePro/Sauce%20Code%20Powerline%20Regular.otf
  mv Sauce\ Code\ Powerline\ Regular.otf ~/.local/share/fonts/
  sudo fc-cache -v
}

######################
# Rails Setup
######################
ror(){
  echo "Installing ruby and rails... \n"
  sleep 2
  #install dependencies
  sudo apt-get update
  sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

  \curl -sSL https://get.rvm.io | bash -s stable --rails
  source ~/.rvm/scripts/rvm
  rvm install 2.1.5
  rvm use 2.1.5 --default
  ruby -v
  gem install rails
  rails -v
}

######################
# Postgres Setup
######################
postgres(){
  echo "Installing Postgres... \n"
  sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
  wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
  sudo apt-get update
  sudo apt-get install postgresql-common
  sudo apt-get install postgresql-9.3 libpq-dev
}


######################
# Install Weechat
######################
weechat(){
  echo "Installing Weechat... \n"
  sleep 2
  sudo add-apt-repository ppa:nesthib/weechat-stable
  sudo apt-get update
  sudo apt-get install weechat
}

######################
# Clone Relavant Repos
######################
repos(){
  echo "Creating personal workspace... \n"
  sleep 2
  mkdir -p ~/workspace/websites
  mkdir -p ~/workspace/projects
  mkdir -p ~/workspace/applications
  echo "Cloning Relevant Repos..."
  sleep 2
  cd ~/workspace/applications
  git clone git@bitbucket.org:kevinweaver/ems-heroes.git
  git clone git@bitbucket.org:kevinweaver/hackerhang.git
  cd ~/workspace/projects
  git clone git@bitbucket.org:kevinweaver/kidshealth-longtail.git
  git clone git@bitbucket.org:kevinweaver/nemours-slider.git
  git clone git@bitbucket.org:kevinweaver/nemours-bmi.git
  
}

######################
# Dotfile Symlinks
######################
dotfiles(){
  echo "Symlinking dotfiles... \n"
  sleep 2
  rm $HOME/.zshrc
  rm $HOME/.weechat
  rm $HOME/.vimrc
  rm $HOME/.tmux
  ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
  ln -s $HOME/.dotfiles/.zsh_aliases $HOME/.zsh_aliases
  ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
  ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
  ln -s $HOME/.dotfiles/.tmux $HOME/.tmux
  ln -s $HOME/.dotfiles/.fontconfig $HOME/.fontconfig
  ln -s $HOME/.dotfiles/.fonts $HOME/.fonts
  ln -s $HOME/.dotfiles/.weechat $HOME/.weechat
  mkdir -p $HOME/.vim/tmp $HOME/.vim/backups
}

######################
# Setup Vim
######################
vim(){
  echo "Installing Vim and Vundle Plugins... \n"
  sleep 2
  sudo apt-get install vim
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
}

######################
# Ip tables
######################
final(){
  echo -e "Adding ISP throttling IP to iptables...\n"
  sudo iptables -A INPUT -s 173.194.55.0/24 -j DROP
  sudo iptables -A INPUT -s 206.111.0.0/16 -j DROP
}


terminal
lamp
python
node
powerline
ror
postgres
weechat
repos
dotfiles
vim
final
