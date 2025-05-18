# AutoMac

AutoMac contains scripts and configurations for automating the setup of a new mac system. It includes installation of essential tools applications and shell configurations, with configurable scripts and settings so reinitializing your Mac machine is easier than ever.

## Table of Contents
- [AutoMac](#automac)
  - [Table of Contents](#table-of-contents)
  - [What You'll Find                           # this file](#what-youll-find----------------------------this-file)
  - [Prerequisites](#prerequisites)
  - [Getting Started](#getting-started)
  - [Script Descriptions](#script-descriptions)
    - [init-mac.sh](#init-macsh)
    - [launch-config.sh](#launch-configsh)
    - [mac-config.sh](#mac-configsh)
    - [zshrc-template.sh](#zshrc-templatesh)

## What You'll Find                           # this file

- iTerm2 Installation & Configuration
  - Theme & Plugin Installation
  - Oh my Zsh Installation & Configuration
- Quick Action Scripts + Installation Guide
- MacOS Tips & MacOS Tools + Installation
- Basic VSCode Extensions You Need

## Prerequisites

- Mac OS (be sure to run updates beforehand)
- Administrator privileges
- Stable internet connection
- iTerm2 (though, the script checks & installs it during the process)
  - Full Disk Access
    - Inside of Settings → Privacy & Security → Full Disk Access, you want to ensure that iTerm2 is turned on; this can only be accomplished once the application has been installed.

## Getting Started

1. Download the files by clicking the green 'Code' button above and selecting 'Download ZIP'.
2. Unzip it.
3. Review the installation.md file for more information. 

*This file can be found in your recently downloaded project folder.*

## Script Descriptions

### init-mac.sh

The initial setup script that:
**Step 1:** Checks for & installs iTerm2, if needed
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
- Plugin Configurations
- Path Settings
- Aliases
- Custom configurations

*See [AutoMac Configuration](configuration.md) for more information.*

For basic troubleshooting steps, see [AutoMac Installation](installation.md).