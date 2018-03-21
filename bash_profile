export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\n\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -aGFh --color=auto'
alias bashReload='source ~/.bash_profile'

# Name a Bash Window/Tab
function bashName() {
    echo -e "\003];$1\007"
}

# Kill all running Node tasks
alias killNode='killall -KILL node'

# general path munging
PATH=$PATH:~/bin
PATH=$PATH:/usr/local/bin

# term vi mode
set -o vi

# git stuff
alias gb='git branch'
alias gbd='git branch -d'
alias gc='git checkout'
alias gs='git status'
alias gcb='git checkout -b'
alias cpk='cat package.json'
alias g='yarn gizmo'
alias story='yarn storybook'

test -f ~/.git-completion.bash && . $_

export VISUAL=vim
export EDITOR="$VISUAL"
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
	# Set config variables first
		 GIT_PROMPT_ONLY_IN_REPO=1

		 GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
		 # GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules

		 # GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
		 # GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files

		 # GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

		 # GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

		 GIT_PROMPT_END_USER=" \n${White}${ResetColor} $ "
		 GIT_PROMPT_END_ROOT=" \n${White}${ResetColor} # "

		 # reload_git_prompt_colors "Custom"
		 # as last entry source the gitprompt script
		 # GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
		 # GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
		 # GIT_PROMPT_THEME=Default_Ubuntu

		 source ~/.bash-git-prompt/gitprompt.sh
fi

