# ----------------------------------------------
# History.
#
# https://unix.stackexchange.com/questions/389881/history-isnt-preserved-in-zsh
# ----------------------------------------------

HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

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

	# Error code from previous command.
	PROMPT+=%(?..%F{red}(%?%)${NL}%f)

	# Current time, working dir, VCS info.
	PROMPT+="${NL}"
	PROMPT+="%F{green}%*%f"
	PROMPT+=" %F{blue}%~%f"
	PROMPT+=" %F{yellow}${vcs_info_msg_0_}%f"
	PROMPT+="${NL}"

	# Dynamic context.
	if [ $AWS_PROFILE ]; then
		PROMPT+="%F{white}aws: ${AWS_PROFILE}%f${NL}"
	fi

	# Prompt CTA.
	PROMPT+="%F{yellow}$%f%F{yellow}$%f%F{yellow}$%f "
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
alias ".."="cd .."

# TF CDK.
alias bs="bin/synth"
alias bt="bin/tf"

# Folders.
alias personal="cd ~/Documents/code/personal"
alias vh="cd ~/Documents/code/work/vh"

# Kubernetes.
alias k="kubectl"

# Terraform.
alias tf="terraform"
alias tfia="terraform init ; terraform apply"

# AWS SSO.
alias a-login="a-systest-admin ; aws sso login --region eu-north-1"

# Envs.
alias a-mgmt-admin="export AWS_PROFILE=aira.MGMT.admin"
alias a-systest-admin="export AWS_PROFILE=aira.TEST.admin ; kubectx arn:aws:eks:eu-north-1:361629632765:cluster/systest"
alias a-uat-admin="export AWS_PROFILE=aira.TEST.admin ; kubectx arn:aws:eks:eu-north-1:361629632765:cluster/uat"
alias a-prod-admin="export AWS_PROFILE=aira.PROD.admin ; kubectx arn:aws:eks:eu-north-1:528895488893:cluster/prod"
alias a-tools-admin="export AWS_PROFILE=aira.TOOLS.admin ; kubectx arn:aws:eks:eu-north-1:660263384063:cluster/tools"

alias atuin-admin="export AWS_PROFILE=atuin.ADMIN"

# ----------------------------------------------
# Fish-like autosuggestions.
#
# brew install zsh-autosuggestions
# ----------------------------------------------

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ----------------------------------------------
# Makefile auto-complete.
#
# See: https://unix.stackexchange.com/questions/657256/autocompletion-of-makefile-with-makro-in-zsh-not-correct-works-in-bash
# ----------------------------------------------

zstyle ':completion::complete:make:*:targets' call-command true

# ----------------------------------------------
# Granted.dev
# ----------------------------------------------

alias assume="source assume"

#fpath=(/Users/khu/.granted/zsh_autocomplete/assume/ $fpath)
#fpath=(/Users/khu/.granted/zsh_autocomplete/granted/ $fpath)
