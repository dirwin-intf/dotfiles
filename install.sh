#!/bin/bash
# ask for sudo upfront
sudo -v

DEFAULT_TIMEOUT=$(sudo tail -1 /etc/sudoers)
if [ "$DEFAULT_TIMEOUT" != "Defaults timestamp_timeout=-1" ]; then
  echo 'Set default timeout in sudoers file to -1 with "sudo visudo"'
  exit
fi

VIM="$HOME/.vim"
NVM="$HOME/.nvm"
FONTS="$HOME/Library/Fonts/"
PROGRAMMING_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip"
LATEX_FONTS="$HOME/.fonts"
LATEX_FONT_URL="https://mirrors.ctan.org/fonts/arev.zip"

# make local/temp directories
mkdir $VIM
mkdir $NVM
mkdir $LATEX_FONTS
mkdir tmp

# copy config files
/bin/bash ./update-dotfiles.sh

# install homebrew
if [ -z $(which brew) ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# source bashrc to refresh path
source $HOME/.bashrc

# developer shit
brew install vim
brew install nvm
brew install cmake

# pandoc stuff -- convert .md to .pdf
brew install pandoc
brew install --cask mactex

# download fonts
curl -fLo ./tmp/arev.zip  $LATEX_FONT_URL
unzip ./tmp/arev.zip -d ./tmp/arev/
mv ./tmp/arev/ $LATEX_FONTS/
curl -fLo ./tmp/programming-font.zip $PROGRAMMING_FONT_URL
unzip ./tmp/programming-font.zip -d ./tmp/programming-font/
mv ./tmp/programming-font/ $FONTS/

# refresh bashrc
source $HOME/.bashrc

# install node
nvm install lts/fermium

# refresh bashrc
source $HOME/.bashrc

# install vim-plug and plugins
VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs $VIM_PLUG_URL
vim -c "PlugInstall" -c "qa"
python3 $VIM/plugged/YouCompleteMe/install.py --ts-completer

# echo "Cleaning up..."
rm -rf ./tmp/
echo "Pick the installed font in iterm properties"
