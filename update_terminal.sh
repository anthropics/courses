#!/bin/bash

# Add these lines to .bashrc if they don't exist
cat >> ~/.bashrc << 'EOL'

# Set up terminal for Japanese
case $TERM in
    xterm*)
        export LANG=ja_JP.UTF-8
        export LC_ALL=ja_JP.UTF-8
        ;;
esac

# Enable UTF-8 display
if [ "$TERM" = "xterm" ]; then
    echo -ne '\e%G\e[?47h\e%G'
fi
EOL

# Source the updated .bashrc
source ~/.bashrc

echo "Terminal settings updated. Please restart your terminal."