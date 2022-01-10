# zplug
source ~/.zplug/init.zsh

zplug "themes/agnoster", from:oh-my-zsh
ZSH_THEME="agnoster"

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "b4b4r07/enhancd", use:init.sh

# install plugins if there are plugins that have not been installed.
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# source plugins and add commands to $PATH
zplug load


# basic
autoload -Uz colors
colors

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified


zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' ignore-parents parent pwd ..

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


# option
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt ignore_eof
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob


# key binding
# bindkey '^R' history-incremental-pattern-search-backward
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down


# alias
alias ll='ls -alhGF'
alias mkdir='mkdir -p'
alias -g L='| less'
alias -g G='| grep'
alias g='cd $(ghq root)/$(ghq list | peco)'
# alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'


# Others
# Custom shell scripts
export PATH="$HOME/bin:$PATH"

# Homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Git & GitHub
export PATH="/opt/homebrew/share/git-core/contrib/diff-highlight:$PATH"
export GPG_TTY=$(tty)

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Swift
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

# go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# node
export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

# vim
export LC_ALL=en_US.UTF-8

# Rust
# source "$HOME/.cargo/env"

# Flutter
export PATH="$HOME/development/flutter/bin:$PATH"

eval $(/opt/homebrew/bin/brew shellenv)
