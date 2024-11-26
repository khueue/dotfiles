# Relaxed typing.
alias q='exit'
alias ll='ls -l'
alias lla='ll -a'
alias c='clear'

# Awesome tab completion.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi
