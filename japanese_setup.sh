#!/bin/bash

# Install required packages
sudo apt-get update
sudo apt-get install -y language-pack-ja fonts-ipafont fonts-ipafont-gothic fonts-ipafont-mincho

# Setup locale
sudo locale-gen ja_JP.UTF-8
sudo update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja" LC_ALL=ja_JP.UTF-8

# Setup user's locale environment
cat > ~/.locale_settings << 'EOL'
export LANG=ja_JP.UTF-8
export LANGUAGE="ja_JP:ja"
export LC_ALL=ja_JP.UTF-8
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
EOL

# Add to .profile and .bashrc
if ! grep -q "source ~/.locale_settings" ~/.profile; then
    echo "source ~/.locale_settings" >> ~/.profile
fi

if ! grep -q "source ~/.locale_settings" ~/.bashrc; then
    echo "source ~/.locale_settings" >> ~/.bashrc
fi

# Configure terminal
cat > ~/.Xresources << 'EOL'
XTerm*locale: true
XTerm*utf8: 1
XTerm*fontMenu*fontdefault*Label: Default
XTerm*faceName: IPAGothic
XTerm*faceSize: 11
XTerm*cjkWidth: true
XTerm*background: black
XTerm*foreground: white
EOL

# Load Xresources
xrdb -merge ~/.Xresources 2>/dev/null || echo "xrdb command not available"

# Source the new settings
source ~/.locale_settings

echo "Setup completed. Current locale settings:"
locale