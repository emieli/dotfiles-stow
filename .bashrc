PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

if [ -f /opt/homebrew/etc/bash_completion ]; then
    . /opt/homebrew/etc/bash_completion
fi


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend

# Silence MacOS message about zsh being default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

alias ls='ls --color=auto'
alias ll='ls -lh'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias glo='git log --oneline -n 10'
if [ -f ~/.local/bin/nvim/bin/nvim ]; then
    alias vim='nvim'
fi

export PATH=$HOME/.local/bin/nvim/bin:$PATH
export PATH=$HOME/.local/bin/go/bin:$HOME/go/bin:$PATH

if [ -f ~/.local/bin/node/bin/node ]; then
    export PATH=$PATH:~/.local/bin/node/bin
fi

