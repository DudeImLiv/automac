#!/bin/zsh

# wait for iTerm2 to fully initialize
sleep 2

# change to the correct directory
cd "$HOME/scripts/configuration/mac"

# run the config script
zsh mac-config.sh

# keep the window open
echo "Press Enter to close this window..."
read -r 