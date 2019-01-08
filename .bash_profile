export BASH_FILE="bashrc"
# general path munging
BASE16_SHELL=$HOME/.config/base16-shell/

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
export VISUAL=nvim
export EDITOR="$VISUAL"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\n\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:/usr/local/bin:$GOBIN:$HOME/bin:$HOME/.cargo/bin:/usr/bin:$HOME/.local/bin:$HOME/.cabal/bin:$HOME/Library/Haskell/bin
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/jake.munoz/work/appcurator/node_modules/tabtab/.completions/serverless.bash ] && . /Users/jake.munoz/work/appcurator/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/jake.munoz/work/appcurator/node_modules/tabtab/.completions/sls.bash ] && . /Users/jake.munoz/work/appcurator/node_modules/tabtab/.completions/sls.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# add Cabal's bin directory to the executable search PATH if it exists
# if [ -d "$HOME/.cabal/bin" ] ; then
#     PATH="$HOME/.cabal/bin:$PATH"
# fi
#
# # add Stack's bin directory to the executable search PATH if it exists
# if [ -d "$HOME/.local/bin" ] ; then
#     PATH="$HOME/.local/bin:$PATH"
# 	fi

# Name a Bash Window/Tab
function bashName() {
    echo -e "\003];$1\007"
}



# term vi mode
set -o vi

alias ls='ls -aGFh'
alias ll='ls -aGFhl'
alias bashReload='source ~/.bash_profile'
# Kill all running Node tasks
alias killNode='killall -KILL node'
alias cpk='cat package.json'
alias g='yarn gizmo'
alias story='yarn storybook'
test -f ~/.git-completion.bash && . $_

source ~/.bash-git-prompt/gitprompt.sh
source /Users/jake.munoz/alacritty/alacritty-completions.bash
# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\n\$ "
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad
# [[ -s ~/.bashrc ]] && source ~/.bashrc
if [ -e /Users/jake.munoz/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jake.munoz/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

if [ -d "$HOME/adb-fastboot" ] ; then
 export PATH="$HOME/adb-fastboot:$PATH"
fi

export PATH="$HOME/.cargo/bin:$PATH"
