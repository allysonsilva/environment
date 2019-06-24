# https://wiki.archlinux.org/index.php/zsh
# https://github.com/robbyrussell/oh-my-zsh/blob/master/templates/zshrc.zsh-template

if [[ -z "$TERMINAL_VSCODE" && -z "$HYPER_SHELL" ]]; then
    echo
    if [[ $EUID -ne 0 ]]; then
        echo "\u256D─────────────────────\u256E"
        echo -e "│ \e[38;05;255m\uf120\e[m  \e[38;05;021m\ue608\e[m  \e[38;05;202m\ue73f\e[m  \e[38;05;011m\ue781\e[m  \e[38;05;010m\ufd42\e[m  \e[38;05;033m\ue77f\e[m  \e[38;05;124m\ue755\e[m │"
        echo "\u2570─────────────────────\u256F"
    fi
fi

# ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
# ↓↓↓↓↓↓↓↓↓ THEME CONFIGURATION ↓↓↓↓↓↓↓↓↓↓↓↓
# ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

# @see https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/termsupport.zsh#L55
DISABLE_AUTO_TITLE="true"

### PROMPT CUSTOMIZATION ###
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator context history dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status time)

### FONT ICONS - @see https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-2-use-a-programmer-font ###
POWERLEVEL9K_MODE='nerdfont-complete' # awesome-fontconfig || nerdfont-complete || awesome-patched

### GENERAL ###
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_DISABLE_RPROMPT=false

# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B1'
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B3'

# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{red}╭─"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{red}╰─\ue601%f "
# OR
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}╭─"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}╰─ \uf489%f "
# OR
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{default}╭─"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{default}╰\uf101%f "
# OR
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}┏"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}┗%f "
# OR
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{red}╭"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{red}╰%{%F{default}%} "
# OR
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{red}\u256D\u2500%f"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{red}\u2570%F{red}\uF460 %F{red}\ue73f%f "
# @see https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
# OR [JS+Laravel]
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" %F{yellow}\ue781 %F{red}\ue73f%f "

### GENERAL BACKGROUND/FOREGROUND ###
POWERLEVEL9K_OS_ICON_BACKGROUND="clear"
POWERLEVEL9K_OS_ICON_FOREGROUND="white"
POWERLEVEL9K_SSH_FOREGROUND="yellow"

### VI-MODE ###
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='green'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='blue'

### STATUS ###
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true
POWERLEVEL9K_STATUS_OK=true
POWERLEVEL9K_STATUS_SHOW_PIPESTATUS=true

POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="196"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="052"

### HISTORY ###
POWERLEVEL9K_HISTORY_BACKGROUND='000'
POWERLEVEL9K_HISTORY_FOREGROUND='yellow'

### GIT ###
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

POWERLEVEL9K_VCS_CLEAN_BACKGROUND="green"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="magenta"

### USER/CONTEXT ###
export DEFAULT_USER=$USER
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=false
POWERLEVEL9K_ALWAYS_SHOW_USER=false

if [[ -n $SSH_CONNECTION ]]; then
  POWERLEVEL9K_CONTEXT_TEMPLATE="%n@`hostname -f`" # Default(%n@%m|username@hostname) @see http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Login-information
else
  POWERLEVEL9K_CONTEXT_TEMPLATE="\uF109 Allyson Silva" # @see http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Login-information
fi

### ICONS ###
POWERLEVEL9K_ROOT_ICON="\uf0e7"
POWERLEVEL9K_EXECUTION_TIME_ICON="\uf253"
POWERLEVEL9K_USER_ICON="\uf2bd"
POWERLEVEL9K_SSH_ICON="\uF489"
POWERLEVEL9K_HOST_ICON="\uF109"
POWERLEVEL9K_OK_ICON="\uf00c"
POWERLEVEL9K_OK_ICON="\uf00c"
POWERLEVEL9K_FAIL_ICON="\uf00d"
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417 "
POWERLEVEL9K_VCS_GIT_ICON="\ue702 "
POWERLEVEL9K_VCS_GIT_GITHUB_ICON="\uf113 "

### COMMAND EXECUTION TIME ###
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="012"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="000"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2

### RAM ###
POWERLEVEL9K_RAM_BACKGROUND="black"
POWERLEVEL9K_RAM_FOREGROUND="249"
POWERLEVEL9K_RAM_ICON="\uf233"
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)

### DIRECTORY ###
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=".."
POWERLEVEL9K_SHORTEN_STRATEGY="default" # [default, truncate_middle, truncate_from_right, truncate_to_unique]
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=false

POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="black"

POWERLEVEL9K_DIR_HOME_BACKGROUND='011'
POWERLEVEL9K_DIR_HOME_FOREGROUND='000'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='blue'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='050'

### TIME ###
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}" #  15:20
# POWERLEVEL9K_TIME_FORMAT="%D{%T \uF017}" #  15:20:44
POWERLEVEL9K_TIME_BACKGROUND="012"
# # OR
# POWERLEVEL9K_TIME_BACKGROUND="000"
# POWERLEVEL9K_TIME_FOREGROUND="008"

### ZSH-SYNTAX-HIGHLIGHTING ###
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line)

typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[cursor]='bold'
ZSH_HIGHLIGHT_STYLES[path]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[path_pathseparator]="fg=grey,bold"
ZSH_HIGHLIGHT_STYLES[alias]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[builtin]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[function]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[command]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[redirection]="fg=magenta"
ZSH_HIGHLIGHT_STYLES[bracket-level-1]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-2]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-3]="fg=magenta,bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-4]="fg=yellow,bold"

### HISTORY ###
HISTFILE=/dev/null # Do not save ZSH history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HIST_STAMPS="dd.mm.yyyy"
HIST_IGNORE_SPACE="true"

export HISTORY_IGNORE="([ ] *|vi *)"

# ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
# ↓↓↓↓↓↓↓↓↓ ENVIRONMENT ↓↓↓↓↓↓↓↓↓↓↓↓
# ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

# VIM
if [[ -x $(which vim 2> /dev/null) ]]; then
  alias vi="vim"
else
  alias vim="vi"
fi

### GO ###
export GOPATH=$HOME/.golang
# export GOPATH=$HOME/go
# export GOROOT=/usr/local/opt/go/libexec
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin

### PATHs ###

if brew ls --versions openssl > /dev/null; then
  export PATH="$(brew --prefix openssl)/bin:$PATH"
fi

# if brew ls --versions openssl@1.1 > /dev/null; then
#   export PATH="$(brew --prefix openssl@1.1)/bin:$PATH"
# fi

if brew ls --versions icu4c > /dev/null; then
  export PATH="$(brew --prefix icu4c)/bin:$PATH"
  export PATH="$(brew --prefix icu4c)/sbin:$PATH"
fi

# if brew ls --versions sphinx-doc > /dev/null; then
#   export PATH="$(brew --prefix sphinx-doc)/bin:$PATH"
# fi

if brew ls --versions python > /dev/null; then
  export PATH="$(brew --prefix python)/bin:$PATH"
  export PATH="$(brew --prefix python)/libexec/bin:$PATH"
fi

export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/Cellar/rabbitmq-c/0.9.0/lib/pkgconfig"
export PATH=$PATH:/usr/local/opt/rabbitmq/sbin

# [ ! -z "$(brew ls --versions go)" ] && export PATH="$(brew --prefix go)/libexec/bin:$PATH"
[ ! -z "$(brew ls --versions sqlite)" ] && export PATH="$(brew --prefix sqlite)/bin:$PATH"
[ ! -z "$(brew ls --versions curl-openssl)" ] && export PATH="$(brew --prefix curl-openssl)/bin:$PATH"
[ ! -z "$(brew ls --versions gettext)" ] && export PATH="$(brew --prefix gettext)/bin:$PATH"
[ ! -z "$(brew ls --versions libxml2)" ] && export PATH="$(brew --prefix libxml2)/bin:$PATH"

export PATH="$(brew --prefix)/bin:/usr/local/sbin:$HOME/.composer/vendor/bin:$PATH"

[ ! -z "$(brew ls --versions php)" ] && export PATH="$(brew --prefix php)/bin:$PATH"

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export PATH="/usr/local/opt/ruby/bin:$PATH"

# if [ -e "/Applications/Postgres.app" ]; then
#   export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin"
# fi

# if [ -e "/Applications/Visual Studio Code.app" ]; then
#   export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# fi

# ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
# ﹅﹅﹅﹅﹅﹅﹅ ZSH ﹅﹅﹅﹅﹅﹅﹅
# ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

# Path to your oh-my-zsh installation.
export ZSH=/Users/allysonsilva/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# see https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [[ -z "$TERMINAL_VSCODE" ]]; then
  ZSH_THEME="powerlevel9k/powerlevel9k"
else
  ZSH_THEME="robbyrussell"
fi
# ✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓
# agnoster                         ✓
# amuse                            ✓
# materialshell-dark               ✓
# materialshell-oceanic            ✓
# materialshellelectro             ✓
# powerlevel9k/powerlevel9k        ✓
# robbyrussell                     ✓
# ✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm node docker docker-compose z httpie)

source $ZSH/oh-my-zsh.sh

# ❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒
# ❒❒❒❒❒❒❒ SOURCE CUSTOMIZATIONS ❒❒❒❒❒❒❒
# ❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒

# Source local zsh customizations
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Source functions and aliases
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases
