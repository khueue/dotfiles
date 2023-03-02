# ----------------------------------------------
# Prompt.
#
# See:
# - https://dev.to/cassidoo/customizing-my-zsh-prompt-3417
# - https://www.nikhita.dev/automate-display-of-time-taken-by-command
# - https://tau.gr/posts/2021-06-08-zsh-command-time/
# ----------------------------------------------

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
NL=$'\n'

function preexec() {
	timer=${timer:-$SECONDS}
}

function precmd() {
	if [ $timer ]; then
		timer_show=$(($SECONDS - $timer))
		export RPROMPT="%F{cyan}${timer_show}s %{$reset_color%}"
		unset timer
	fi
	vcs_info
	PROMPT=""
	PROMPT=%(?..%B(%?%)%b)
	PROMPT+="${NL}"
	PROMPT+="%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f${NL}"
	PROMPT+="%F{red}$%f "
}

# ----------------------------------------------
# Case-insensitive tab-completion.
#
# See:
# - https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
# ----------------------------------------------

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ----------------------------------------------
# Aliases.
# ----------------------------------------------

# Misc.
alias c="clear"
alias q="exit"
alias t="tree"
alias ll="ls -al"

# TF CDK.
alias bs="bin/synth"
alias bt="bin/tf"

# Folders.
alias personal="cd ~/Documents/code/personal"
alias vh="cd ~/Documents/code/work/vh"

# ----------------------------------------------
# Fish-like autosuggestions.
#
# brew install zsh-autosuggestions
# ----------------------------------------------

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ----------------------------------------------
# Granted.dev
# ----------------------------------------------

alias assume="source assume"

fpath=(/Users/khu/.granted/zsh_autocomplete/assume/ $fpath)
fpath=(/Users/khu/.granted/zsh_autocomplete/granted/ $fpath)
