autoload -Uz colors
colors

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "


autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' ignore-parents parent pwd ..

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


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

bindkey '^R' history-incremental-pattern-search-backward


alias ll='ls -al'

alias mkdir='mkdir -p'

alias sudo='sudo '

alias -g L='| less'
alias -g G='| grep'

