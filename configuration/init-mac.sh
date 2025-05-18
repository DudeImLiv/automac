# init-mac.sh

# usage: this installs iterm2 and launches iterm2,
# which will then run the full install script (mac-config.sh)

# important note: you must right-click on the file after you have saved it, & select Get Info. in the Get Info window, you will see 'Where' followed by the path to the file... you can right-click this, copy it and use that as the prefix to your file path. you will use this method often when needing a specific file path. REMINDER: this path does not include the file name, you will have to append the file name to the path.

# this has been adapted into a Quick Action script that can be run from the Finder, the script is called... 'get-path.sh'.

#!/bin/bash

# debug mode - set to true to enable logging
DEBUG=true

# error handling
set -e # exit on error
trap 'echo "Error occurred at line $LINENO. Command: $BASH_COMMAND"' ERR
trap 'echo "Script interrupted at line $LINENO"; exit 1' INT TERM

# logging setup
if [ "$DEBUG" = true ]; then
    # create logging directory if it doesn't exist
    LOG_DIR="$HOME/scripts/configuration/automac/logging"
    mkdir -p "$LOG_DIR"

    LOG_FILE="$LOG_DIR/mac-setup-init-$(date +%Y%m%d_%H%M%S).log"
    # simple logging without process substitution
    exec 1>>"$LOG_FILE"
    exec 2>>"$LOG_FILE"
    echo "=== Mac Setup Init Log Started at $(date) ==="
    echo "Log file: $LOG_FILE"
    echo "----------------------------------------"
    echo "Current directory: $(pwd)"
    echo "Script location: $(dirname "$0")"
    echo "User: $USER"
    echo "Shell: $SHELL"
fi

# function to check if an application is installed via Homebrew Cask
is_app_installed() {
    brew list --cask "$1" &>/dev/null
}

# function to check if an application exists in /Applications
check_app_exists() {
    [ -d "/Applications/$1.app" ] || [ -d "$HOME/Applications/$1.app" ]
}

# function to check if we're currently running in iTerm2
is_running_in_iterm() {
    [ "$TERM_PROGRAM" = "iTerm.app" ]
}

echo "Checking iTerm2 installation status..."
ITERM_INSTALLED=false
if check_app_exists "iTerm"; then
    echo "✅ iTerm2 is already installed in Applications"
    ITERM_INSTALLED=true
elif is_app_installed "iterm2"; then
    echo "✅ iTerm2 is already installed via Homebrew"
    ITERM_INSTALLED=true
else
    echo "📦 Installing iTerm2..."
    if brew install --cask iterm2; then
        echo "✅ iTerm2 installation successful"
        ITERM_INSTALLED=true
    else
        echo "❌ Failed to install iTerm2"
        exit 1
    fi
fi

CONFIG_SCRIPT="$HOME/scripts/configuration/automac/mac-config.sh"

if [ "$ITERM_INSTALLED" = true ] && is_running_in_iterm; then
    echo "🚀 Running configuration script in current iTerm2 window..."
    sh "$CONFIG_SCRIPT"
else
    echo "🚀 Launching iTerm2 and starting configuration script..."

    # get the absolute path to the launch script
    LAUNCH_SCRIPT="$(cd "$(dirname "$0")" && pwd)/launch-config.sh"

    # make sure the launch script is executable
    chmod +x "$LAUNCH_SCRIPT"

    # launch iTerm2 with the config script using a simpler osascript command
    osascript -e "tell application \"iTerm\" to activate" \
        -e "tell application \"iTerm\" to create window with default profile" \
        -e "tell application \"iTerm\" to tell current window to tell current session to write text \"zsh '$LAUNCH_SCRIPT'\""
fi
