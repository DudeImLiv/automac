eval "$(/opt/homebrew/bin/brew shellenv)"

# if you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# ------------------------------------------------------------------------------ #
#                      ** INITIAL SETUP INSTRUCTIONS **                          #
# ------------------------------------------------------------------------------ #
# SECTION (setup) - instructions for users

# $HOME is a built-in shell variable that points to your home directory
# you can check your home directory by running:
# echo $HOME

# to find your homebrew path, run these commands in terminal:
# 1. for homebrew binary path:
#    which brew
# 2. for homebrew prefix:
#    brew --prefix

# to find your python path, run this command in terminal:
# which python3

# to find your oh-my-zsh installation path, run this command in terminal:
# echo $ZSH
# see https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH for more information
# regarding the installation of oh my zsh.

# !SECTION 

# ------------------------------------------------------------------------------ #
#                      ** PLUGIN SOURCING & PATHS **                             #
# ------------------------------------------------------------------------------ #
# SECTION (paths)

# oh my zsh installation directory
# replace with your oh-my-zsh path from the command above
# this variable is used in other paths, like the ones below
export ZSH="$HOME/.oh-my-zsh"

# load oh my zsh framework
source $ZSH/oh-my-zsh.sh

# homebrew binaries path
# replace with your homebrew path from the command above
# this variable is used in other paths, like the ones below
export PATH="/opt/homebrew/bin:$PATH"

# homebrew prefix variable
# replace with your homebrew prefix from the command above
# this variable is used in other paths, like the ones below
export HOMEBREW_PREFIX="/opt/homebrew"

# source zsh syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source zsh autosuggestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# source zsh autocomplete 
source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# python path configuration
# replace with your python path from the command above
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# !SECTION

# ------------------------------------------------------------------------------ #
#                            ** ALIAS VARIABLES **                               #
# ------------------------------------------------------------------------------ #

# SECTION aliases

# SECTION quick commands

# SUBSECTION zsh + bash config

# if you're using VSCode, you will use 'code' as the IDE.
# if you're using Cursor, you will use 'cursor' as the IDE.

export IDE="code"

# alias for IDE config files
alias zconfig="$IDE ~/.zshrc" # used only if you're using oh my zsh
alias bconfig="$IDE ~/.bashrc" # used only if you're not using oh my zsh
alias bsource="source ~/.bashrc" # used only if you're not using oh my zsh
alias zsource="source ~/.zshrc" # used only if you're using oh my zsh

# instead of remembering the command to open or run these files, you can use these
# aliases as shortcuts in the terminal. running the alias of 'zconfig' will run the
# command 'code ~/.zshrc' in the terminal. or 'cursor ~/.zshrc', depending on your
# chosen IDE.

# !SUBSECTION

# !SECTION end of quick commands

# !SECTION end of aliases

# ------------------------------------------------------------------------------ #
#                        ** SOURCING & PATH CONT. **                             #
# ------------------------------------------------------------------------------ #

# SECTION (sourcing)

# console ninja path
PATH=~/.console-ninja/.bin:$PATH

# set the flask app variable
export FLASK_APP=app.py

# source zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# !SECTION end of sourcing

# ------------------------------------------------------------------------------ #
#                     ** CONFIGURATIONS & CUSTOMIZATIONS **                      #
# ------------------------------------------------------------------------------ #

# most of the following pertains to the oh my zsh framework for iTerm2, highly
# recommended to use in conjunction with iTerm2. 
# see https://github.com/ohmyzsh/ohmyzsh/wiki for more information.

# be sure to read through these comment to see which of the configurations you
# might prefer to use. some are commented out, so you can uncomment them as you
# see fit.

# SECTION (custom)

# zsh-autocomplete configurations
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# history navigation key bindings - these will allow cycling through history while
# keeping the zsh-autocomplete plugin active
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# set list of themes to pick from when loading at random
# setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# if set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# uncomment the following line to use hyphen-insensitive completion.
# case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# uncomment the following line to display red dots whilst waiting for completion.
# you can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# uncomment the following line if you want to disable marking untracked files
# under vcs as dirty. this makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# you can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# which plugins would you like to load?
# standard plugins can be found in $ZSH/plugins/
# custom plugins may be added to $ZSH_CUSTOM/plugins/
# example format: plugins=(rails git textmate ruby lighthouse)
# add wisely, as too many plugins slow down shell startup.
plugins=(git tldr)

# plugin information can be found at 
    # https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins

# specific plugin details:
# git: the git plugin provides many aliases and a few useful functions
# tldr: this plugin adds a shortcut to insert tldr before the previous command

# adding 'starship' or 'autosuggestions', etc. is unnecessary since we are
# sourcing them directly in the paths section. this bypasses issues we might have
# with the plugins not sourcing correctly when adding them to the plugins list.

# !SECTION

# !SECTION end of custom

# ------------------------------------------------------------------------------ #
#                           ** USER CONFIGURATIONS **                            #
# ------------------------------------------------------------------------------ #
# SECTION (config)

# export MANPATH="/usr/local/man:$MANPATH"

# you may need to manually set your language environment
# export LANG=en_US.UTF-8

# preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# compilation flags
# export ARCHFLAGS="-arch x86_64"

# set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# for a full list of active aliases, run `alias`.
#
# example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# initialize pyenv and starship
# note: make sure you have pyenv and starship installed before uncommenting these lines
eval "$(pyenv init --path)"
eval "$(starship init zsh)"

# !SECTION end of config

# ------------------------------------------------------------------------------ #
