![Starship – Cross-shell prompt](https://raw.githubusercontent.com/starship/starship/master/media/logo.png)

[![GitHub Actions workflow status](https://img.shields.io/github/actions/workflow/status/starship/starship/workflow.yml?branch=master&label=workflow&style=flat-square)](https://github.com/starship/starship/actions)[![Crates.io version](https://img.shields.io/crates/v/starship?style=flat-square)](https://crates.io/crates/starship)[![Packaging status](https://img.shields.io/repology/repositories/starship?label=in%20repositories&style=flat-square)](https://repology.org/project/starship/versions)  
[![Chat on Discord](https://img.shields.io/discord/567163873606500352?label=discord&logoColor=white&style=flat-square)](https://discord.gg/starship)[![Follow @StarshipPrompt on Twitter](https://img.shields.io/badge/twitter-@StarshipPrompt-1DA1F3?style=flat-square)](https://twitter.com/StarshipPrompt)[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraineFlat.svg)](https://stand-with-ukraine.pp.ua)

[Website](https://starship.rs) · [Installation](#🚀-installation) · [Configuration](https://starship.rs/config/)

[![English](https://raw.githubusercontent.com/starship/starship/master/media/flag-us.png)](https://github.com/starship/starship/blob/master/README.md)   [![Deutsch](https://raw.githubusercontent.com/starship/starship/master/media/flag-de.png)](https://github.com/starship/starship/blob/master/docs/de-DE/guide/README.md)   [![Español](https://raw.githubusercontent.com/starship/starship/master/media/flag-es.png)](https://github.com/starship/starship/blob/master/docs/es-ES/guide/README.md)   [![Français](https://raw.githubusercontent.com/starship/starship/master/media/flag-fr.png)](https://github.com/starship/starship/blob/master/docs/fr-FR/guide/README.md)   [![Bahasa Indonesia](https://raw.githubusercontent.com/starship/starship/master/media/flag-id.png)](https://github.com/starship/starship/blob/master/docs/id-ID/guide/README.md)   [![Italiano](https://raw.githubusercontent.com/starship/starship/master/media/flag-it.png)](https://github.com/starship/starship/blob/master/docs/it-IT/guide/README.md)   [![日本語](https://raw.githubusercontent.com/starship/starship/master/media/flag-jp.png)](https://github.com/starship/starship/blob/master/docs/ja-JP/guide/README.md)   [![Português do Brasil](https://raw.githubusercontent.com/starship/starship/master/media/flag-br.png)](https://github.com/starship/starship/blob/master/docs/pt-BR/guide/README.md)   [![Русский](https://raw.githubusercontent.com/starship/starship/master/media/flag-ru.png)](https://github.com/starship/starship/blob/master/docs/ru-RU/guide/README.md)   [![Українська](https://raw.githubusercontent.com/starship/starship/master/media/flag-ua.png)](https://github.com/starship/starship/blob/master/docs/uk-UA/guide/README.md)   [![Tiếng Việt](https://raw.githubusercontent.com/starship/starship/master/media/flag-vn.png)](https://github.com/starship/starship/blob/master/docs/vi-VN/guide/README.md)   [![简体中文](https://raw.githubusercontent.com/starship/starship/master/media/flag-cn.png)](https://github.com/starship/starship/blob/master/docs/zh-CN/guide/README.md)   [![繁體中文](https://raw.githubusercontent.com/starship/starship/master/media/flag-tw.png)](https://github.com/starship/starship/blob/master/docs/zh-TW/guide/README.md)

![Starship with iTerm2 and the Snazzy theme](https://raw.githubusercontent.com/starship/starship/master/media/demo.gif)

**The minimal, blazing-fast, and infinitely customizable prompt for any shell!**

*   **Fast:** it's fast – _really really_ fast! 🚀
*   **Customizable:** configure every aspect of your prompt.
*   **Universal:** works on any shell, on any operating system.
*   **Intelligent:** shows relevant information at a glance.
*   **Feature rich:** support for all your favorite tools.
*   **Easy:** quick to install – start using it in minutes.

[**Explore the Starship docs  ▶**](https://starship.rs/config/)

## 🚀 Installation [​](#🚀-installation)

### Prerequisites [​](#prerequisites)

*   A [Nerd Font](https://www.nerdfonts.com/) installed and enabled in your terminal (for example, try the [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)).

### Step 1. Install Starship [​](#step-1-install-starship)

Select your operating system from the list below to view installation instructions:

Android

Install Starship using any of the following package managers:

| Repository | Instructions |
| --- | --- |
| Termux | pkg install starship |

BSD

Install Starship using any of the following package managers:

| Distribution | Repository | Instructions |
| --- | --- | --- |
| Any | crates.io | cargo install starship --locked |
| FreeBSD | FreshPorts | pkg install starship |
| NetBSD | pkgsrc | pkgin install starship |

Linux

Install the latest version for your system:

sh

    curl -sS https://starship.rs/install.sh | sh

Alternatively, install Starship using any of the following package managers:

| Distribution | Repository | Instructions |
| --- | --- | --- |
| Any | crates.io | cargo install starship --locked |
| Any | conda-forge | conda install -c conda-forge starship |
| Any | Linuxbrew | brew install starship |
| Alpine Linux 3.13+ | Alpine Linux Packages | apk add starship |
| Arch Linux | Arch Linux Extra | pacman -S starship |
| CentOS 7+ | Copr | dnf copr enable atim/starshipdnf install starship |
| Debian 13+ | Debian Main | apt install starship |
| Gentoo | Gentoo Packages | emerge app-shells/starship |
| Manjaro |  | pacman -S starship |
| NixOS | nixpkgs | nix-env -iA nixpkgs.starship |
| openSUSE | OSS | zypper in starship |
| Ubuntu 25.04+ | Ubuntu Universe | apt install starship |
| Void Linux | Void Linux Packages | xbps-install -S starship |

macOS

Install the latest version for your system:

sh

    curl -sS https://starship.rs/install.sh | sh

Alternatively, install Starship using any of the following package managers:

| Repository | Instructions |
| --- | --- |
| crates.io | cargo install starship --locked |
| conda-forge | conda install -c conda-forge starship |
| Homebrew | brew install starship |
| MacPorts | port install starship |

Windows

Install the latest version for your system with the MSI-installers from the [releases section](https://github.com/starship/starship/releases/latest).

Install Starship using any of the following package managers:

| Repository | Instructions |
| --- | --- |
| crates.io | cargo install starship --locked |
| Chocolatey | choco install starship |
| conda-forge | conda install -c conda-forge starship |
| Scoop | scoop install starship |
| winget | winget install --id Starship.Starship |

### Step 2. Set up your shell to use Starship [​](#step-2-set-up-your-shell-to-use-starship)

Configure your shell to initialize starship. Select yours from the list below:

Bash

Add the following to the end of `~/.bashrc`:

sh

    eval "$(starship init bash)"

Cmd

You need to use [Clink](https://chrisant996.github.io/clink/clink.html) (v1.2.30+) with Cmd. Create a file at this path `%LocalAppData%\clink\starship.lua` with the following contents:

lua

    load(io.popen('starship init cmd'):read("*a"))()

Elvish

Add the following to the end of `~/.elvish/rc.elv`:

sh

    eval (starship init elvish)

Note: Only Elvish v0.18+ is supported

Fish

Add the following to the end of `~/.config/fish/config.fish`:

fish

    starship init fish | source

Ion

Add the following to the end of `~/.config/ion/initrc`:

sh

    eval $(starship init ion)

Nushell

Add the following to the end of your Nushell configuration (find it by running `$nu.config-path` in Nushell):

sh

    mkdir ($nu.data-dir | path join "vendor/autoload")
    starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

Note: Only Nushell v0.96+ is supported

PowerShell

Add the following to the end of your PowerShell configuration (find it by running `$PROFILE`):

powershell

    Invoke-Expression (&starship init powershell)

Tcsh

Add the following to the end of `~/.tcshrc`:

sh

    eval `starship init tcsh`

Xonsh

Add the following to the end of `~/.xonshrc`:

python

    execx($(starship init xonsh))

Zsh

Add the following to the end of `~/.zshrc`:

sh

    eval "$(starship init zsh)"

### Step 3. Configure Starship [​](#step-3-configure-starship)

Start a new shell instance, and you should see your beautiful new shell prompt. If you're happy with the defaults, enjoy!

If you're looking to further customize Starship:

*   **[Configuration](https://starship.rs/config/)** – learn how to configure Starship to tweak your prompt to your liking
    
*   **[Presets](https://starship.rs/presets/)** – get inspired by the pre-built configuration of others
    

## 🤝 Contributing [​](#🤝-contributing)

We are always looking for contributors of **all skill levels**! If you're looking to ease your way into the project, try out a [good first issue](https://github.com/starship/starship/labels/%F0%9F%8C%B1%20good%20first%20issue).

If you are fluent in a non-English language, we greatly appreciate any help keeping our docs translated and up-to-date in other languages. If you would like to help, translations can be contributed on the [Starship Crowdin](https://translate.starship.rs/).

If you are interested in helping contribute to starship, please take a look at our [Contributing Guide](https://github.com/starship/starship/blob/master/CONTRIBUTING.md). Also, feel free to drop into our [Discord server](https://discord.gg/8Jzqu3T) and say hi. 👋

## 💭 Inspired By [​](#💭-inspired-by)

Please check out these previous works that helped inspire the creation of starship. 🙏

*   **[denysdovhan/spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt)** – A ZSH prompt for astronauts.
    
*   **[denysdovhan/robbyrussell-node](https://github.com/denysdovhan/robbyrussell-node)** – Cross-shell robbyrussell theme written in JavaScript.
    
*   **[reujab/silver](https://github.com/reujab/silver)** – A cross-shell customizable powerline-like prompt with icons.
    

## ❤️ Sponsors [​](#❤️-sponsors)

Support this project by [becoming a sponsor](https://github.com/sponsors/starship). Your name or logo will show up here with a link to your website.

## 🔒 Code Signing Policy [​](#🔒-code-signing-policy)

Free code signing provided by [SignPath.io](https://signpath.io), certificate by [SignPath Foundation](https://signpath.org).

Code Signing Roles:

*   Reviewers: [Astronauts](https://github.com/orgs/starship/teams/astronauts)
*   Approvers and Authors: [Mission Control](https://github.com/orgs/starship/teams/mission-control)

This program will not transfer any information to other networked systems unless specifically requested by the user or the person installing or operating it.

  
![Starship rocket icon](https://raw.githubusercontent.com/starship/starship/master/media/icon.png)

## 📝 License [​](#📝-license)

Copyright © 2019-present, [Starship Contributors](https://github.com/starship/starship/graphs/contributors).  
This project is [ISC](https://github.com/starship/starship/blob/master/LICENSE) licensed.