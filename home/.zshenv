# ----------------------------------------------
# History.
#
# https://unix.stackexchange.com/questions/389881/history-isnt-preserved-in-zsh
# ----------------------------------------------

HISTSIZE=100000
SAVEHIST=10000
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

# AWS SSO.
alias aira-login="iam-cloud-admin-tools ; aws sso login ; ecr-tools"

alias ecr-tools="aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin 660263384063.dkr.ecr.eu-north-1.amazonaws.com"

# Envs.
alias iam-aira-admin-mgmt="export AWS_PROFILE=aira-admin-mgmt"
alias iam-aira-admin-systest="export AWS_PROFILE=aira-admin-test ; kubectx arn:aws:eks:eu-north-1:361629632765:cluster/systest"
alias iam-aira-admin-uat="export AWS_PROFILE=aira-admin-test ; kubectx arn:aws:eks:eu-north-1:361629632765:cluster/uat"
alias iam-aira-admin-prod="export AWS_PROFILE=aira-admin-prod ; kubectx arn:aws:eks:eu-north-1:528895488893:cluster/prod"
alias iam-aira-admin-tools="export AWS_PROFILE=aira-admin-tools ; kubectx arn:aws:eks:eu-north-1:660263384063:cluster/tools"

# New profiles.
alias iam-cloud-admin-systest="export AWS_PROFILE=cloud-admin-test ; kubectx arn:aws:eks:eu-north-1:361629632765:cluster/systest"
alias iam-cloud-admin-uat="export AWS_PROFILE=cloud-admin-test ; kubectx arn:aws:eks:eu-north-1:361629632765:cluster/uat"
alias iam-cloud-admin-prod="export AWS_PROFILE=cloud-admin-prod ; kubectx arn:aws:eks:eu-north-1:528895488893:cluster/prod"
alias iam-cloud-admin-tools="export AWS_PROFILE=cloud-admin-tools ; kubectx arn:aws:eks:eu-north-1:660263384063:cluster/tools"

# IoT Mgmt.
alias iot-systest="export AWS_PROFILE=iot-test ; kubectx arn:aws:eks:eu-north-1:361629632765:cluster/systest"
alias iot-uat="export AWS_PROFILE=iot-test ; kubectx arn:aws:eks:eu-north-1:361629632765:cluster/uat"
alias iot-prod="export AWS_PROFILE=iot-prod ; kubectx arn:aws:eks:eu-north-1:528895488893:cluster/prod"
alias iot-tools="export AWS_PROFILE=iot-tools ; kubectx arn:aws:eks:eu-north-1:660263384063:cluster/tools"

alias atuin-admin="export AWS_PROFILE=atuin.ADMIN"

alias khet="cd ~/Documents/code/personal/khet"
alias khet-login="export AWS_PROFILE=khet.TEST.admin; aws sso login"
alias khet-coord-admin="export AWS_PROFILE=khet.COORD.admin"
alias khet-prod-admin="export AWS_PROFILE=khet.PROD.admin"
alias khet-test-admin="export AWS_PROFILE=khet.TEST.admin"

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

#################

function jwt() {
  jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "$1"
}
