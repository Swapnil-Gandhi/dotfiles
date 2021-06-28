# Some stuff here is stolen fron quinnypig
#

# various vim commands
alias vim='vim -n -i NONE --cmd "set number"'
alias vim-noswap='vim -n -i NONE --cmd "setlocal noswapfile" --cmd "set nocompatible" --cmd "set tabstop=4" -u NONE'

# various stuff to make the commands more sane
alias mv='nocorrect mv -i'      # prompt before overwriting files
alias mkdir='nocorrect mkdir'   # don't correct mkdir
alias wget='noglob wget'
alias grep='grep --color=auto'

# useful to see what hogs disk space
alias sz='du -ahx | sort -n'

# Some generic aliases
alias df='df -h'
alias du='du -h'
alias rm='rm -i'
alias ll='ls -ltrh'
function mkcd() { mkdir -p "$1"; cd "$1"; }

# global aliases
alias -g      ...=../..
alias -g     ....=../../..
alias -g    .....=../../../..

# display the ten newest files
alias lsnew="ls -rl *(D.om[1,10])"

# display the ten oldest files
alias lsold="ls -rtlh *(D.om[1,10])"

# display the ten smallest files
alias lssmall="ls -Srl *(.oL[1,10])"

# GitHub
#

# When you just don't care anymore
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

function github() {
	# Load version control information
	autoload -Uz vcs_info
	precmd() { vcs_info }

	# Set up the prompt (with git branch name)
	setopt PROMPT_SUBST
	export PROMPT='%F{green}$(parse_git_branch)%f %F{normal}$%f '
	
	cd /Users/swapnil/Documents/github;
}

alias stat='git status'
alias log='git log --pretty=oneline'

# cd to the path of the front Finder window
function cdf() {
    target=`osascript -e 'tell application "Finder" to get POSIX path of (target of front Finder window as text)'`
    cd "$target"
}

# Open a Finder window in your current directory; inverse to cdf()
alias f='open -a Finder ./'

# Make tmux happy
alias tmux="TERM=xterm-256color tmux"

# Great typo correction, presuming thefuck is installed.
alias fuck='$(thefuck $(fc -ln -1))'
