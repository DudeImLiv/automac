# AutoMac Configuration 

- [AutoMac Configuration](#automac-configuration)
  - [Table of Contents](#table-of-contents)
  - [Script Descriptions](#script-descriptions)
    - [Initialize AutoMac](#initialize-automac)
    - [Launch AutoMac](#launch-automac)
    - [Apply Configuration](#apply-configuration)
    - [zshrc-template.sh](#zshrc-templatesh)
  - [Installed Components](#installed-components)
    - [Core Tools](#core-tools)
    - [Shell Plugins](#shell-plugins)
    - [Applications (Remove/Add as needed)](#applications-removeadd-as-needed)
  - [Logging](#logging)
  - [Post-Installation](#post-installation)
  - [Troubleshooting](#troubleshooting)
    - [Common Issues](#common-issues)
    - [Error Handling](#error-handling)
  - [Maintenance](#maintenance)
    - [Updating Configurations](#updating-configurations)
    - [Adding New Applications](#adding-new-applications)
    - [Other Configurations](#other-configurations)

## Script Descriptions

### [Initialize AutoMac](configuration/init-mac.sh)

The initial setup script that:
**Step 1:** Checks for and installs iTerm2, if needed
   - If iTerm2 is already installed, it moves onto Step 2.
**Step 2:** Launches iTerm2
**Step 3:** Initiates the configuration process

### [Launch AutoMac](configuration/launch-config.sh)

Handles the iTerm2 launch process:
**Step 1:** Waits for iTerm2 to initialize
**Step 2:** Changes to the correct directory
**Step 3:** Runs the main configuration script
**Step 4:** Keeps the window open for viewing output, in case of errors.

### [Apply Configuration](configuration/mac-config.sh)

The main configuration script that:
**Step 1:** Sets up logging
**Step 2:** Installs core tools and applications.

   ***If any Applications are missing that you'd like to add, add them now. See [Adding New Applications](#adding-new-applications) for more information.***

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

*Note: The [zshrc-template.sh](configuration/iterm2-ref/zshrc-template.sh) and [starship.toml](configuration/iterm2-ref/starship.toml) files are both used to apply the configurations to the ones that are created on your screen.*

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
1. Edit the [Mac Configuration](/configuration/mac-config.sh) file.
2. Add the application to the `apps` array
    a. Since this script uses Homebrew to install applications, verify the intended casks and application taps on the [Brew Homepage](https://brew.sh/) using the Search function. Note: this might *not* involve '--cask', but will be stated in the either way on the Homebrew website. 
3. Test the installation process. 
    a. To test the installation, run the following command in your Terminal:
       `brew install --cask application-name`

*Replace "application-name" with the exact name of the application as it appears in Homebrew's cask list.*

### Other Configurations

Follow the instructions outlined in both the documentation/quick-actions.md and the documentation/vscode-ext.md file. 