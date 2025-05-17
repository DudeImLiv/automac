# Advanced Installation [​](#advanced-installation)

To install starship, you need to do two things:

1.  Get the **starship** binary onto your computer
2.  Tell your shell to use the starship binary as its prompt by modifying its init scripts

For most users, the instructions on [the main page](./../guide/#🚀-installation) will work great. However, for some more specialized platforms, different instructions are needed.

There are so many platforms out there that they didn't fit into the main README.md file, so here are some installation instructions for other platforms from the community. Is yours not here? Please do add it here if you figure it out!

## [Chocolatey](https://chocolatey.org) [​](#chocolatey)

### Prerequisites [​](#prerequisites)

Head over to the [Chocolatey installation page](https://chocolatey.org/install) and follow the instructions to install Chocolatey.

### Installation [​](#installation)

powershell

    choco install starship

## [termux](https://termux.com) [​](#termux)

### Prerequisites [​](#prerequisites-1)

sh

    pkg install getconf

### Installation [​](#installation-1)

sh

    curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir /data/data/com.termux/files/usr/bin

## [Funtoo Linux](https://www.funtoo.org/Welcome) [​](#funtoo-linux)

### Installation [​](#installation-2)

On Funtoo Linux, starship can be installed from [core-kit](https://github.com/funtoo/core-kit/tree/1.4-release/app-shells/starship) via Portage:

sh

    emerge app-shells/starship

## [Nix](https://wiki.nixos.org/wiki/Nix) [​](#nix)

### Getting the Binary [​](#getting-the-binary)

#### Imperatively [​](#imperatively)

sh

    nix-env -iA nixos.starship

#### Declarative, single user, via [home-manager](https://github.com/nix-community/home-manager) [​](#declarative-single-user-via-home-manager)

Enable the `programs.starship` module in your `home.nix` file, and add your settings

nix

    {
      programs.starship = {
        enable = true;
        # Configuration written to ~/.config/starship.toml
        settings = {
          # add_newline = false;
    
          # character = {
          #   success_symbol = "[➜](bold green)";
          #   error_symbol = "[➜](bold red)";
          # };
    
          # package.disabled = true;
        };
      };
    }

then run

sh

    home-manager switch

#### Declarative, system-wide, with NixOS [​](#declarative-system-wide-with-nixos)

Add `pkgs.starship` to `environment.systemPackages` in your `configuration.nix`, then run

sh

    sudo nixos-rebuild switch