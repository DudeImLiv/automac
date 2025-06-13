# mac-config.sh

# usage: this is the main install script that will be run inside iterm2.
# it will install all the applications and tools that are needed for the mac setup.

#!/bin/zsh

# debug mode - set to true to enable logging
DEBUG=true

# error handling
set -e  # exit on error
trap 'echo "Error occurred at line $LINENO. Command: $BASH_COMMAND"; echo "Error details: $(cat $LOG_FILE | tail -n 20)"' ERR
trap 'echo "Script interrupted at line $LINENO"; exit 1' INT TERM

# logging setup
if [ "$DEBUG" = true ]; then
    # create logging directory if it doesn't exist
    LOG_DIR="$HOME/scripts/configuration/automac/logging"
    mkdir -p "$LOG_DIR"
    
    LOG_FILE="$LOG_DIR/mac-setup-$(date +%Y%m%d_%H%M%S).log"
    # simple logging without process substitution
    exec 1>> "$LOG_FILE"
    exec 2>> "$LOG_FILE"
    echo "=== Mac Setup Log Started at $(date) ==="
    echo "Log file: $LOG_FILE"
    echo "----------------------------------------"
    echo "Current directory: $(pwd)"
    echo "Script location: $(dirname "$0")"
    echo "User: $USER"
    echo "Shell: $SHELL"
fi

# function to print rainbow progress bar
print_rainbow_bar() {
    local current=$1
    local total=$2
    local percent=$((100 * current / total))
    printf "\rProgress: [%3d%%]" "$percent"
}

# function to handle errors gracefully
handle_error() {
    local exit_code=$1
    local line_no=$2
    local command=$3
    echo "✘ Error occurred at line $line_no: $command"
    echo "Exit code: $exit_code"
    [ "$DEBUG" = true ] && echo "[DEBUG] Error details logged to: $LOG_FILE" | tee -a "$LOG_FILE"
    
    # pause to show error message
    echo "Press Enter to continue..."
    read -r
    exit "$exit_code"
}

trap 'handle_error $? $LINENO "$BASH_COMMAND"' ERR

animate_progress() {
    local from=$1
    local to=$2
    local total=$3

    for ((i = from + 1; i <= to; i++)); do
        print_rainbow_bar "$i" "$total"
        sleep 0.01 # smooth animation speed
    done
}

# function to check if a command exists
command_exists() {
    command -v "$1" &>/dev/null
}

# function to check if an application is installed via homebrew cask
is_app_installed() {
    local app_name="$1"
    if [ -z "$app_name" ]; then
        echo "Error: No application name provided to is_app_installed function"
        return 1
    fi
    brew list --cask "$app_name" &>/dev/null
    return $?
}

# function to check if an application exists in /applications
check_app_exists() {
    [ -d "/Applications/$1.app" ] || [ -d "$HOME/Applications/$1.app" ]
}

echo "⚙︎ Starting system configuration check..."

# 1. check and set homebrew path
echo "⌕ Looking for Homebrew path in .zshrc..."
ZSHRC=~/.zshrc
ZSHRC_TEMPLATE="$HOME/scripts/configuration/automac/iterm2-ref/zshrc-template.sh"

# backup existing .zshrc if it exists
if [ -f "$ZSHRC" ]; then
    echo "⚙︎ Backing up existing .zshrc..."
    mv "$ZSHRC" "${ZSHRC}.backup"
    echo "✔ .zshrc backed up as ${ZSHRC}.backup"
fi

echo "✔ Homebrew path verified"
export PATH="/opt/homebrew/bin:$PATH"

# 2. check and install oh my zsh
echo "⌕ Looking for Oh My Zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "✔ Found Oh My Zsh already installed!"
else
    echo "↻ Oh My Zsh not found. Installing now..."
    animate_progress 0 100 100
    # prevent oh my zsh installer from trying to change the shell
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "✔ Oh My Zsh installed successfully!"
    else
        echo "✘ Failed to install Oh My Zsh"
    fi
fi

# 3. check and install homebrew
echo "⌕ Looking for Homebrew..."
if command_exists brew; then
    echo "✔ Found Homebrew already installed!"
else
    echo "↻ Homebrew not found. Installing now..."
    animate_progress 0 100 100
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        echo "✘ Failed to install Homebrew"
    }
fi

# 4. update and check homebrew taps
echo "↻ Updating Homebrew..."
if brew update; then
    echo "✔ Homebrew updated!"
else
    echo "⚠ Homebrew update had some issues, but continuing..."
fi

echo "⌕ Looking for Homebrew Cask tap..."
if brew tap | grep -q "homebrew/cask"; then
    echo "✔ Found Homebrew Cask tap already configured!"
else
    echo "⚙︎ Homebrew Cask tap not found. Adding now..."
    if brew tap homebrew/cask; then
        echo "✔ Homebrew Cask tap added successfully!"
    else
        echo "⚠ Failed to add Homebrew Cask tap, but continuing anyway..."
        if brew --version | grep -q "cask"; then
            echo "✔ Homebrew Cask appears to be available despite tap error"
        fi
    fi
fi

# 5. check and install node.js
echo "⌕ Looking for Node.js..."
if command_exists node; then
    echo "✔ Found Node.js already installed!"
else
    echo "↻ Node.js not found. Installing now..."
    animate_progress 0 100 100
    if brew install node; then
        echo "✔ Node.js installed successfully!"
    else
        echo "✘ Failed to install Node.js"
    fi
fi

# 6. check and install starship
echo "⌕ Looking for Starship..."
[ "$DEBUG" = true ] && echo "[DEBUG] Starting Starship installation check..." | tee -a "$LOG_FILE"

STARSHIP_INSTALLED=false
STARSHIP_CONFIGURED=false

# check if Starship is installed
if command_exists starship; then
    echo "✔ Found Starship already installed!"
    [ "$DEBUG" = true ] && echo "[DEBUG] Starship is already installed" | tee -a "$LOG_FILE"
    STARSHIP_INSTALLED=true
else
    echo "↻ Starship not found. Installing now..."
    [ "$DEBUG" = true ] && echo "[DEBUG] Starship not found, attempting installation..." | tee -a "$LOG_FILE"
    animate_progress 0 100 100
    if brew install starship; then
        echo "✔ Starship installed successfully!"
        [ "$DEBUG" = true ] && echo "[DEBUG] Starship installation successful" | tee -a "$LOG_FILE"
        STARSHIP_INSTALLED=true
    else
        echo "✘ Failed to install Starship"
        [ "$DEBUG" = true ] && echo "[DEBUG] Starship installation failed" | tee -a "$LOG_FILE"
        exit 1
    fi
fi

# check if starship is configured
if [ -f ~/.config/starship.toml ]; then
    echo "✔ Found existing Starship configuration!"
    [ "$DEBUG" = true ] && echo "[DEBUG] Found existing Starship configuration at ~/.config/starship.toml" | tee -a "$LOG_FILE"
    STARSHIP_CONFIGURED=true
fi

# configure starship if needed
if [ "$STARSHIP_CONFIGURED" = false ]; then
    echo "⚙︎ Configuring Starship..."
    [ "$DEBUG" = true ] && echo "[DEBUG] Starting Starship configuration..." | tee -a "$LOG_FILE"
    mkdir -p ~/.config

    # check if we have a local starship.toml template
    if [ -f "$(dirname "$0")/starship.toml" ]; then
        echo "✏︎ Copying Starship configuration from template..."
        [ "$DEBUG" = true ] && echo "[DEBUG] Found local starship.toml template, copying..." | tee -a "$LOG_FILE"
        cp "$(dirname "$0")/starship.toml" ~/.config/starship.toml
        echo "✔ Starship configuration copied successfully!"
        [ "$DEBUG" = true ] && echo "[DEBUG] Starship configuration copied successfully" | tee -a "$LOG_FILE"
        STARSHIP_CONFIGURED=true
    else
        echo "⚠ Local starship.toml not found, using default configuration..."
        [ "$DEBUG" = true ] && echo "[DEBUG] Local template not found, using gruvbox-rainbow preset" | tee -a "$LOG_FILE"
        starship preset gruvbox-rainbow -o ~/.config/starship.toml
        STARSHIP_CONFIGURED=true
    fi
fi

# verify starship configuration
if [ -f ~/.config/starship.toml ]; then
    echo "✔ Starship configuration file verified at ~/.config/starship.toml"
    [ "$DEBUG" = true ] && echo "[DEBUG] Starship configuration file verified" | tee -a "$LOG_FILE"
else
    echo "✘ Failed to create Starship configuration file"
    [ "$DEBUG" = true ] && echo "[DEBUG] Failed to verify Starship configuration file" | tee -a "$LOG_FILE"
    exit 1
fi

# 7. install zsh-autocomplete plugin
echo "⚙︎ Installing zsh-autocomplete plugin..."
if [ ! -d "/opt/homebrew/Cellar/zsh-autocomplete" ]; then
    echo "↻ Installing zsh-autocomplete..."
    brew install zsh-autocomplete
    if [ $? -eq 0 ]; then
        echo "✔ zsh-autocomplete installed successfully!"
    else
        echo "⚠ Failed to install zsh-autocomplete, but continuing..."
    fi
else
    echo "✔ zsh-autocomplete already installed!"
fi

# 8. install zsh-syntax-highlighting
echo "⚙︎ Installing zsh-syntax-highlighting..."
if [ ! -d "/opt/homebrew/share/zsh-syntax-highlighting" ]; then
    echo "↻ Installing zsh-syntax-highlighting..."
    brew install zsh-syntax-highlighting
    if [ $? -eq 0 ]; then
        echo "✔ zsh-syntax-highlighting installed successfully!"
    else
        echo "⚠ Failed to install zsh-syntax-highlighting, but continuing..."
    fi
else
    echo "✔ zsh-syntax-highlighting already installed!"
fi

# 9. install zsh-autosuggestions
echo "⚙︎ Installing zsh-autosuggestions..."
if [ ! -d "/opt/homebrew/share/zsh-autosuggestions" ]; then
    echo "↻ Installing zsh-autosuggestions..."
    brew install zsh-autosuggestions
    if [ $? -eq 0 ]; then
        echo "✔ zsh-autosuggestions installed successfully!"
    else
        echo "⚠ Failed to install zsh-autosuggestions, but continuing..."
    fi
else
    echo "✔ zsh-autosuggestions already installed!"
fi

# 10. install pyenv
echo "↻ Installing pyenv..."
if ! command_exists pyenv; then
    echo "↻ Installing pyenv..."
    brew install pyenv
    if [ $? -eq 0 ]; then
        echo "✔ pyenv installed successfully!"
    else
        echo "⚠ Failed to install pyenv, but continuing..."
    fi
else
    echo "✔ pyenv already installed!"
fi

# 11. install gum
echo "⚙︎ Installing gum..."
if ! command_exists gum; then
    echo "↻ Installing gum..."
    brew install gum
    if [ $? -eq 0 ]; then
        echo "✔ gum installed successfully!"
    else
        echo "⚠ Failed to install gum, but continuing..."
    fi
else
    echo "✔ gum already installed!"
fi

# after all installations are complete, apply the template
echo "⇄ Applying final .zshrc configuration..."
if [ -f "$ZSHRC_TEMPLATE" ]; then
    echo "✏︎ Copying template to .zshrc..."
    cp "$ZSHRC_TEMPLATE" "$ZSHRC"
    echo "✔ .zshrc template applied successfully!"
else
    echo "✘ Error: .zshrc template not found at $ZSHRC_TEMPLATE"
    exit 1
fi

# source the new .zshrc
echo "⇄ Sourcing new .zshrc configuration..."
[ "$DEBUG" = true ] && echo "[DEBUG] Sourcing .zshrc..." | tee -a "$LOG_FILE"

# add more detailed error handling for sourcing
if ! source "$ZSHRC"; then
    echo "✘ Error sourcing .zshrc file"
    echo "Last command exit code: $?"
    echo "Current shell: $SHELL"
    [ "$DEBUG" = true ] && echo "[DEBUG] Failed to source .zshrc at line $LINENO" | tee -a "$LOG_FILE"
    exit 1
fi

# verify starship is working
if starship --version > /dev/null 2>&1; then
    echo "✔ Starship is properly installed and configured!"
    [ "$DEBUG" = true ] && echo "[DEBUG] Starship version check successful" | tee -a "$LOG_FILE"
else
    echo "⚠ Starship installation may need manual verification"
    [ "$DEBUG" = true ] && echo "[DEBUG] Starship version check failed" | tee -a "$LOG_FILE"
fi

# 9. install applications
echo "⌕ Starting application installations..."

# list of applications to install
# update these by searching for applications at https://brew.sh/
apps=(
    visual-studio-code
    spotify
    maccy
    bitwarden
    chatgpt
    brave-browser
    microsoft-word
    microsoft-excel
    microsoft-powerpoint
    microsoft-teams
    microsoft-outlook
)

# initialize counters
total_apps=${#apps[@]}
current_app=0
installed_count=0
skipped_count=0
failed_count=0

echo "Found $total_apps applications to check."

# install each application
for app in "${apps[@]}"; do
    ((current_app++))
    echo "Processing $current_app of $total_apps: $app"
    
    # check if app is already installed with better error handling
    if is_app_installed "$app"; then
        echo "✔ $app is already installed via Homebrew"
        ((skipped_count++))
    elif check_app_exists "$app"; then
        echo "✔ $app is already installed in Applications"
        ((skipped_count++))
    else
        echo "↻ Installing $app..."
        if brew install --cask "$app"; then
            echo "✔ $app installed successfully"
            ((installed_count++))
        else
            echo "✘ Failed to install $app"
            ((failed_count++))
        fi
    fi
done

# print summary
echo -e "\n⚙︎ Installation Summary:"
echo "✔ Successfully installed: $installed_count new applications"
echo "▸▸ Skipped (already installed): $skipped_count applications"
if [ $failed_count -gt 0 ]; then
    echo "✘ Failed installations: $failed_count applications"
fi

echo -e "\n⁂ Configuration complete! Your system has been set up with all the specified applications."
echo "Note: You may need to restart your terminal for some changes to take effect."
echo "Thank you for using the setup script!"
echo -e "\n"

# pause to show completion message
echo "Press Enter to exit..."
read -r
