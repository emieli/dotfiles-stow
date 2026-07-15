PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

if [ -f /opt/homebrew/etc/bash_completion ]; then
    . /opt/homebrew/etc/bash_completion
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi


# Sync history between sessions while removing duplicate lines:
# https://unix.stackexchange.com/questions/48713/how-can-i-remove-duplicates-in-my-bash-history-preserving-order/419779#419779
# Install tac on MacOS: "brew install coreutils"
shopt -s histappend
export HISTCONTROL=ignoreboth:erasedups
export PROMPT_COMMAND="history -n; history -w; history -c; history -r"
tac "$HISTFILE" | awk '!x[$0]++' > /tmp/tmpfile  &&
                tac /tmp/tmpfile > "$HISTFILE"
rm /tmp/tmpfile

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

