# Mac Setup Automation

This repository contains scripts and configurations for automating the setup of a new mac system. It includes installation of essential tools applications and shell configurations.

## Directory Structure

```
mac/
├── configuration/
│  └── iterm2-ref/
│     ├── starship.toml                      # starship.toml file reference
│     └── zshrc-template.sh                  # zsh configuration reference
│  └── quick-actions/
│     ├── get-path.sh                        # gets path, including filename
│     ├── kebab-case.sh                      # renames all files/folders to kebab-case
│     ├── list-directories.sh                # lists folders inside folder
│     ├── list-files.sh                       # lists files inside folder
│     └── open-in-vscode.applescript         # open folder/file in vscode
│  ├── init-mac.sh                           # initial setup script
│  ├── launch-config.                         # iTerm2 launch configuration
│  └── mac-config.sh                          # main configuration script
├── documentation/
│  └── starship/
│     ├── starship-config-advanced.md         # Starships Config - Advanced
│     ├── starship-config.md                  # Starships Config
│     ├── starship-get-started.md            # Starships Get Started
│     ├── starship-installation.md           # Starships Installation
│     └── starship-presets.md                # Starships Presets
│  ├── mac-tips.md                           # Mac OS tips
│  ├── mac-tools.md                          # Mac OS tools
│  ├── quick-actions.md                      # list of Quick Actions
│  └── vscode-ext.md                         # list of VSCode extensions
└── README.md                                # this file
```

## Prerequisites

- A mac running Mac OS
- Administrator privileges
- Stable internet connection
- iTerm2 (though, the script runs it during installation.)
  - Full Disk Access
    - Inside of Settings → Privacy & Security → Full Disk Access, you want to ensure that iTerm2 is turned on; this can only be accomplish once the application has been installed.

## Installation Process

### 1. Initial Setup

1. Create the required directory structure:
   ```bash
   mkdir -p ~/scripts/configuration/mac/
   ```

*Note: Unless you've decided on another path for these files. It should be as close to your root directory as possible so that permissions don't stand in the way. Having the scripts/ directory placed within the ~/ directory places it alongside the 'Library' folders inside of your Home directory. You can display your Home directory in your Finder sidebar by navigating to your Finder → Settings → Favorites and tick the option beside the Home icon, likely towards the end of the Favorites list.*

1. Copy configuration scripts to the directory:
   ```bash
   cp -r {/path/to/mac/folder/downloaded/}* ~/scripts/configuration/mac/
   ```

*Note: Make sure you replace the {/path/to/mac/folder/downloaded/} to the path of the original folder that contains the configuration files — if downloaded from Github, it will be the unzipped folder in Downloads.* 

***Important Note: Do not forget the asterisk following the path, as that indicates you want to include everything inside of that folder.***

3. Make scripts executable:
   ```bash
   chmod +x ~/scripts/configuration/mac/*.sh
   ```

*Note: Your 'scripts' directory can be setup however you like, but it's easier to have the scripts categorized by application.*

Some examples of scripts/{subdirectories}:
- components: where you can keep files of components that you have built to reuse at a later date.
- configuration: where you can keep copies of configuration files, some subdirectories could be 'mac', 'vscode', 'ssh', 'zshrc', and other applications where a JSON is used for the application settings.
- tools: for entire program directories such as github repositories you've downloaded or small programs you've written yourself.
- quick-actions: where you might keep backup copies of Quick Actions you want to archive or disable, eventually, you might want to remove or disable them to narrow-down the options inside of the menu.

### 2. Running The Setup

***BEFORE YOU BEGIN***
*Read through the mac/configuration/iterm2-ref/zshrc-template.sh to ensure all steps have been completed prior to running the installation... such as verifying the $HOME path. And read through this entire README.md file, to ensure there is nothing else that needs to be handled prior to running this or configuring it to your needs.*

1. Start the installation:
   ```bash
   cd ~/scripts/configuration/mac/
   ./init-mac.sh
   ```

*Note: The init-mac.sh script is written to, in turn, run the other scripts such as, 'mac-config.sh' and 'launch-config.sh'.*

## Script Descriptions

### init-mac.sh

The initial setup script that:
**Step 1:** Checks for and installs iTerm2, if needed
   - If iTerm2 is already installed, it moves onto Step 2.
**Step 2:** Launches iTerm2
**Step 3:** Initiates the configuration process

### launch-config.sh

Handles the iTerm2 launch process:
**Step 1:** Waits for iTerm2 to initialize
**Step 2:** Changes to the correct directory
**Step 3:** Runs the main configuration script
**Step 4:** Keeps the window open for viewing output, in case of errors.

### mac-config.sh

The main configuration script that:
**Step 1:** Sets up logging
**Step 2:** Installs core tools and applications.
*Note: Prior to running the scripts, review the Applications listed in the Applications array and verify their 'brew' application name at https://www.brew.sh by searching for the Application. If any Applications are missing that you'd like to add, add them now. This will help you in the future, when you want to wipe your Mac and run this configuration wizard afterwards.
**Step 3:** Configures shell environment
**Step 4:** Handles error cases and provides progress updates

### zshrc-template.sh

Template for zsh & iTerm2 configuration that includes:
- Oh my Zsh setup
- Plugin configurations
- Path settings
- Aliases
- Custom configurations

## Installed Components

### Core Tools

- Homebrew (Package Manager)
- Oh my Zsh (Shell (iTerm2) Framework)
- Starship (Shell (iTerm2) Prompt)
- Python (Via Pyenv)
- Node.Js

### Shell Plugins

- zsh-autocomplete
- zsh-syntax-highlighting
- zsh-autosuggestions

### Applications (Remove/Add as needed)

*Note: Update this in tandem with your Applications array in the script, that way you can properly document the Applications you're installing.* ***These are optional and customizable to the Applications YOU want to always install on your Mac. See Adding New Applications section below.***

- VSCode (brew install --cask visual-studio-code)
- Spotify (brew install --cask spotify)
- Maccy (brew install --cask maccy)
- Bitwarden (brew install --cask bitwarden)
- ChatGPT (brew install --cask chatgpt)
- Brave Browser (brew install --cask brave-browser)
- Microsoft Word (brew install --cask microsoft-word)
- Microsoft Excel (brew install --cask microsoft-excel)
- Microsoft Outlook (brew install --cask microsoft-outlook)
- Microsoft Powerpoint (brew install --cask microsoft-powerpoint)
- Adobe Acrobat Reader (brew install --cask adobe-acrobat-reader)

## Logging

The setup process creates detailed logs:
- Location: `~/Desktop/`
   *Note: To change this, you can locate it within the script and change it to ~/scripts/configuration/mac/logging and it will create a logging folder inside of your directory if one doesn't exist.*
- Format: `mac-setup-YYYYMMDD_HHMMSS.log`
- Includes: Installation Progress, Errors, and System Information

*Customize any and all of the logging to suit your needs.*

## Post-Installation

1. Restart your terminal to apply all changes
2. Some applications may require additional setup.

## Troubleshooting

### Common Issues

1. **Script Permissions**
   - Ensure all scripts are executable
   - Run `chmod +x *.sh` (where *.sh represents whatever the filename might be, followed by the .sh extension).

2. **Homebrew Installation**
   - If homebrew fails to install, run:
     ```bash
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     ```

3. **Zsh Configuration**
   - If shell configuration fails, check:
     - Oh my Zsh installation
     - plugin paths
     - Starship configuration

*Note: The zshrc-template.sh and starship.toml files are both uses to apply the configurations to the ones that are created on your screen.*

### Error Handling

- Check log files in dedicated logging directory for detailed error messages.
- Verify internet connection.
- Ensure administrator privileges and 'Full Disk Access' if necessary.

## Maintenance

### Updating Configurations

1. Backup existing configuration:
   *Note: Always backup .zshrc file. For extra precautions, it's advisable to create a copy of the .zshrc file and store it within your script/configurations/zshrc directory if you have one.*
   ```bash
   cp ~/.zshrc ~/.zshrc.backup
   ```

2. Apply new configuration:
   ```bash
   cp zshrc-template.sh ~/.zshrc
   source ~/.zshrc
   ```

### Adding New Applications

To add new applications to the setup:
1. Edit `mac-config.sh`
2. Add the application to the `apps` array
    a. Since this script uses Homebrew to install applications, you should check the https://brew.sh/ page (using the Search Input) to discover the specific `brew install --cask` application variable. Note: this might *not* involve '--cask', but will be stated in the Homebrew page. 
3. Test the installation process. 
    a. To test the installation, run:
       ```bash
       brew install --cask [application-name]
       ```
       Replace `[application-name]` with the exact name of the application as it appears in Homebrew's cask list.

### Other Configurations

Follow the instructions outlined in both the documentation/quick-actions.md and the documentation/vscode-ext.md file. 