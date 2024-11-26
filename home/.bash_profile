# Mac is moving away from Bash.
export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f "$HOME/.secrets.sh" ]; then
    source "$HOME/.secrets.sh"
fi

# Terminal colours.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Long history.
export HISTFILESIZE=100000
export HISTSIZE=100000

export DOCKER_BUILDKIT=1

# Locale (variables in descending precedence order).
# See: http://pubs.opengroup.org/onlinepubs/7908799/xbd/envvar.html
export LC_ALL=
export LC_COLLATE="sv_SE.UTF-8"
export LC_CTYPE="sv_SE.UTF-8"
export LANG="en_US.UTF-8"

export EDITOR="vim"

# Customized prompt.
BOLD="\[$(tput bold)\]"
COLOR="\[$(tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"
export PS1="$BOLD$COLOR[ BASH: \w ]\n\$ $RESET"

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# Had issues with Kitty messing up SSH terminals.
export TERM=xterm-256color

# Continue with fish!
#fish
