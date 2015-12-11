export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
alias 'll'='ls -alh'
alias 'gosh'='rlwrap gosh'

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/KAGE/Programming/Library/cocos2d-x/cocos2d-x-3.8.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/KAGE/Programming/Library/cocos2d-x/cocos2d-x-3.8.1/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# for PostgreSQL
export PGDATA=/usr/local/var/postgres

# for git
source /usr/local/git/contrib/completion/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
