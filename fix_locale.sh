#!/bin/bash

# Install required packages if not already installed
sudo apt-get update
sudo apt-get install -y language-pack-ja fonts-ipafont fonts-ipafont-gothic fonts-ipafont-mincho

# Generate Japanese locale
sudo locale-gen ja_JP.UTF-8

# Set system-wide locale settings
sudo update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja" LC_ALL=ja_JP.UTF-8

# Set user-specific locale settings
cat > ~/.locale_settings << 'EOL'
export LANG=ja_JP.UTF-8
export LANGUAGE="ja_JP:ja"
export LC_ALL=ja_JP.UTF-8
EOL

# Add locale settings to both .profile and .bashrc to ensure they're loaded
if ! grep -q "source ~/.locale_settings" ~/.profile; then
    echo "source ~/.locale_settings" >> ~/.profile
fi

if ! grep -q "source ~/.locale_settings" ~/.bashrc; then
    echo "source ~/.locale_settings" >> ~/.bashrc
fi

# Source the settings immediately
source ~/.locale_settings

echo "Locale settings have been updated. Please log out and log back in for all changes to take effect."
echo "Current locale settings:"
locale