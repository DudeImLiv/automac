# AutoMac

AutoMac contains scripts and configurations for automating the setup of a new mac system. It includes installation of essential tools applications and shell configurations, with configurable scripts and settings so reinitializing your Mac machine is easier than ever.

- [AutoMac](#automac)
  - [What You'll Find](#what-youll-find)
  - [Prerequisites](#prerequisites)
  - [Getting Started](#getting-started)
  - [Script Descriptions](#script-descriptions)
    - [Initialize AutoMac](#initialize-automac)
    - [Launch AutoMac](#launch-automac)
    - [Apply Configuration](#apply-configuration)
    - [OMZ Template](#omz-template)

## What You'll Find

- iTerm2 Installation & Configuration
  - Theme & Plugin Installation
  - Oh my Zsh Installation & Configuration
- Quick Action Scripts + Installation Guide
- Other Useful Scripts + Snippets
- MacOS Tips & MacOS Tools + Installation
  - MacOS Shortcuts
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
3. Review [AutoMac Installation](installation.md) for more information. 

*This file can be found in your recently downloaded project folder.*

## Script Descriptions

### [Initialize AutoMac](configuration/init-mac.sh)

The initial setup script that:
**Step 1:** Checks for & installs iTerm2, if needed
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

   ***If any Applications are missing that you'd like to add, add them now. See [Adding New Applications](configuration.md#adding-new-applications) for more information.***

**Step 3:** Configures shell environment
**Step 4:** Handles error cases and provides progress updates

### [OMZ Template](configuration/iterm2-ref/zshrc-template.sh)

Template for zsh & iTerm2 configuration that includes:
- Oh my Zsh setup
- Plugin Configurations
- Path Settings
- Aliases
- Custom configurations

*See [AutoMac Configuration](configuration.md) for more information.*

For basic troubleshooting steps, see [AutoMac Installation](installation.md).