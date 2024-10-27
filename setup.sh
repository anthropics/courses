#!/bin/bash

# Install required packages
sudo apt-get update
sudo apt-get install -y vim xclip fcitx-mozc language-pack-ja fonts-ipafont

# Setup vim with monokai theme
mkdir -p ~/.vim/colors
curl -o ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/crusoexia/vim-monokai/master/colors/monokai.vim

# Create .vimrc with basic settings
cat > ~/.vimrc << 'EOL'
syntax enable
colorscheme monokai
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set number
EOL

# Setup locale for Japanese
sudo locale-gen ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LANGUAGE=ja_JP:jp
export LC_ALL=ja_JP.UTF-8

# Setup input method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx-autostart &

# Create/Update .bash_profile
cat > ~/.bash_profile << 'EOL'
echo "loaded .bash_profile"
alias vb="vi ~/.bash_profile"
alias sb="source ~/.bash_profile"
alias pl="git pull"
alias gs="git status"

# Set locale
export LANG=ja_JP.UTF-8
export LANGUAGE=ja_JP:jp
export LC_ALL=ja_JP.UTF-8

# Set input method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
EOL

# Source the new .bash_profile
source ~/.bash_profile

echo "Setup completed! Please restart your terminal to apply all changes."