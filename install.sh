#! /bin/bash

#install rbenv on osx or any linux
rbenvInstall() {
  git clone git://github.com/sstephenson/rbenv.git $HOME/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.zshrc
  git clone git://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
  echo "If you're not using the zshrc in this repo add eval "$(rbenv init -)" to your bashrc or zshrc."
}

#build vim from source
buildVim(){
  sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
  sudo apt-get remove vim vim-runtime gvim
  cd ~
  hg clone https://code.google.com/p/vim/
  cd vim
  ./configure --with-features=huge \
              --enable-rubyinterp \
              --enable-pythoninterp \
              --enable-perlinterp \
              --enable-gui=gtk2 --enable-cscope --prefix=/usr
  make VIMRUNTIMEDIR=/usr/share/vim/vim73
  sudo make install
}

#ubuntu YCM plugin plugin installation
ubuYCM() {
  echo -e "Installing YCM plugin plugin... \n"
  sudo apt-get install build-essential cmake python-dev
  cd $HOME/.vim/bundle/YouCompleteme
  ./install.sh --clang-completer
}

ubuPowerline() {
  sudo apt-get install python-pip
  pip install --user git+git://github.com/Lokaltog/powerline
  echo "set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim" >> $HOME/.vimrc
  mkdir $HOME/.fonts && cd $HOME/.fonts
  fontConfDir='unset'
  if [[ -d "$HOME/.fonts.conf.d" ]]; then   #fontconfig
    fontConfDir="$HOME/.fonts.conf.d"
  elif  [[ -d "$HOME/.config/fontconfig/conf.d" ]]; then  
    fontConfDir="$HOME/.config/fontconfig/conf.d"
  fi
  if [[ $fontConfDir != 'unset' ]]; then
    echo -e "Setting up fontconfig so powerline has proper symbols...\n"
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
    cd $fontConfDir && wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
  else # no fontconfig detected
    echo -e "Downloading two patched fonts (Inconsolata/DroidSansMono) that you can set for use in your terminal of choice since fontconfig failed...\n"
    wget https://github.com/Lokaltog/powerline-fonts/tree/master/Inconsolata/Inconsolata\ for\ Powerline.otf
    wget https://github.com/Lokaltog/powerline-fonts/tree/master/DroidSansMono/Inconsolata\ for\ Powerline.otf
  fi
  fc-cache -vf $HOME/.fonts
  echo -e "Powerline should have installed successfully.  Locate it and add rtp+=path/to/powerline/bindings/vim to your vimrc.\n":
}

#Install oh-my-zsh
ohmyzsh() {
  echo -e "Installing oh-my-zsh...\n"
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  #in case prompt fails for zsh
  chsh -s /bin/zsh
}

echo -e "Installing zsh and git...\n"
sudo apt-get update; sudo apt-get install curl wget zsh git

#Build Vim from Source
buildVim
#install oh-my-zsh
ohmyzsh

#Install vimrc zshrc and functions
echo -e "Symlinking vimrc, zshrc, tmux.conf and such to HOME...\n"
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.zsh_aliases $HOME/.zsh_aliases
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.tmux $HOME/.tmux
mkdir -p $HOME/.vim/tmp $HOME/.vim/backups

echo -e "Running basic git configuration...\n"
read -p "Enter your name (full name): " name
read -p "Enter your git email address: " email
git config --global user.name "$name"
git config --global user.email "$email"

#Install Pianobar
echo -e "Installing Necessary Pianobar files...\n"
sudo apt-get install git-core libao-dev libmad0-dev libfaac-dev libfaad-dev libgnutls-dev libjson0-dev make
mkdir -p $HOME/applications && cd $HOME/applications
git clone git://github.com/PromyLOPh/pianobar.git
cd pianobar
make clean
make
sudo make install
echo -e "Creating Pianobar configuration...\n"
read -p "Enter your Pandora email: " pandMail
read -p "Enter your Pandora password: " pandPass
mkdir -p $HOME/.config/pianobar/ && touch $HOME/.config/pianobar/config
echo "user = $pandMail" >> $HOME/.config/pianobar/config
echo "password = $pandPass" >> $HOME/.config/pianobar/config

echo -e "Installing Vundle and running BundleInstall for vim plugins...\n"
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
vim +BundleInstall +qall

#YCM BUILD AND POWERLINE INSTALLATION - CURRENTLY NOT AUTOMATED IN OSX DUE TO GOOFY PYTHON ISSUS WITH HOMEBREW / SYSTEM
ubuYCM
echo -e "YCM complete, now installing powerline and its fonts...\n"
ubuPowerline

#rbenv installation
rbenvInstall

#ip tables to prevent a good bit of bullshit ISP throttling
echo -e "Adding ISP throttling IP to iptables...\n"
sudo iptables -A INPUT -s 173.194.55.0/24 -j DROP
sudo iptables -A INPUT -s 206.111.0.0/16 -j DROP
