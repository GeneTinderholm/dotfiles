#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:$HOME/go/bin:$QT_DIR/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export QT_DIR='/home/gene/Qt5.9.2/'
export LD_LIBRARY_PATH=$QT_DIR/lib/$LD_LIBRARY_PATH
export ATHAME_ENABLED=1

export TERM=xterm-256color
export PATH=$HOME/bin:$PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
