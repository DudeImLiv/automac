# AutoMac Installation

- [AutoMac Installation](#automac-installation)
    - [1. Initial Setup](#1-initial-setup)
      - [Project Directory](#project-directory)
    - [2. Running The Setup](#2-running-the-setup)
  - [Post-Installation](#post-installation)
  - [Troubleshooting](#troubleshooting)
    - [Common Issues](#common-issues)
    - [Error Handling](#error-handling)

### 1. Initial Setup

***IMPORTANT*** *Before you get started, download and install a Markdown preview extension to your Visual Studio Code. This will allow you to view and navigate the project files easier. For more recommendations, see [Visual Studio Code Extensions](documentation/vscode-ext.md/#functional--practical).*

#### Project Directory

In the directory, you will find the following file structure:

```
automac/
- configuration/
   - iterm2-ref/
      - starship.toml                      # starship.toml file reference
      - zshrc-template.sh                  # zsh configuration reference
   - quick-actions/
      - get-path.sh                        # gets path, including filename
      - kebab-case.sh                      # renames all files/folders to kebab-case
      - list-directories.sh                # lists folders inside folder
      - list-files.sh                      # lists files inside folder
      - open-in-vscode.applescript         # open folder/file in vscode
   - init-mac.sh                           # initial setup script
   - launch-config.                        # iTerm2 launch configuration
   - mac-config.sh                         # main configuration script
- documentation/
   - starship/                             # Starships handles iTerm2 theming
      - starship-config-advanced.md        # Starships Config - Advanced
      - starship-config.md                 # Starships Config
      - starship-get-started.md            # Starships Get Started
      - starship-installation.md           # Starships Installation
      - starship-presets.md                # Starships Presets
   - mac-tips.md                           # Mac OS Tips
   - mac-tools.md                          # Mac OS Tools
   - quick-actions.md                      # Helpful Quick Actions
   - vscode-ext.md                         # Basic VSCode extensions
- configuration.md                         # AutoMac Configuration
- installation.md                          # AutoMac Installation
- README.md
```

1. Download the files by clicking the green 'Code' button above and selecting 'Download ZIP'.
2. Unzip it.
3. Review the installation.md file for more information.

*This file can be found in your recently downloaded project folder.*

1. Create the required directory structure:
   ```bash
   mkdir -p ~/scripts/configuration/mac
   ```

*Note: Unless you've decided on another path for these files. It should be as close to your root directory as possible so that permissions don't stand in the way. Having the scripts/ directory placed within the ~/ directory places it alongside the 'Library' folders inside of your Home directory. You can display your Home directory in your Finder sidebar by navigating to your Finder → Settings → Favorites and tick the option beside the Home icon, likely towards the end of the Favorites list.*

1. Copy configuration scripts to the directory:
   ```bash
   cp -r ~/Downloads/mac/* ~/scripts/configuration/automac
   ```

*Note: Make sure you replace the '~/Downloads/mac/' path to the path of the original folder that contains the configuration files — if downloaded from Github, it will (likely) be an unzipped folder in Downloads.* 

***Important Note: Do not forget the asterisk following the path, as that indicates you want to include everything inside of that folder when copying.***

3. Make scripts executable:
   ```bash
   chmod +x ~/scripts/configuration/automac/*.sh
   ```

*Note: Your 'scripts' directory can be setup however you like, but it's easier to have the scripts categorized by application. Let's face it, you'll be adding more scripts here as you code.*

**Some examples of scripts/{subdirectories}:**
- components: where you can keep files of components that you have built to reuse at a later date.
- configuration: where you can keep copies of configuration files, some subdirectories could be 'mac', 'vscode', 'ssh', 'zshrc', and other applications where a JSON is used for the application settings.
- tools: for entire program directories such as github repositories you've downloaded or small programs you've written yourself.
- quick-actions: where you might keep backup copies of Quick Actions you want to archive or disable, eventually, you might want to remove or disable them to narrow-down the options inside of the menu.

### 2. Running The Setup

***STOP*** *Before you continue, be sure to read through the [AutoMac Configuration](configuration.md) carefully to complete the final steps.*

1. Run the program:
   ```bash
   cd ~/scripts/configuration/automac/
   ./init-mac.sh
   ```

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
   
   See [Homebrew](https://www.brew.sh) for more information.

3. **Zsh Configuration**
   - If shell configuration fails, check:
     - Oh my Zsh installation
     - plugin paths
     - Starship configuration

*Note: The [OMZ Configuration](configuration/iterm2-ref/zshrc-template.sh) and [Starship Configuration](configuration/iterm2-ref/starship.toml) files are both uses to apply the configurations to the default files that are created.*

### Error Handling

- Check log files in dedicated logging directory for detailed error messages.
- Verify internet connection.
- Ensure administrator privileges and 'Full Disk Access' if necessary.