# conda
# alias cconda='conda3_activate && conda'

# leetcode
alias lcd='leetcode'

# bfg
alias bfg='java -jar $HOME/repo/bin/bfg.jar'

# fix terminal
alias fix='reset; stty sane; tput rs1; clear; echo -e "\033c"'

# cd to current directory
alias pd='cd `pwd`'

# watch cpu frequency
alias freq="watch -n 1 'cat /proc/cpuinfo | grep MHz'"

# aria2c downloader
alias aria="aria2c -x 16 -s 16"

# cmake build dir
alias build="source $HOME/.dotfiles/bin/clean_build"

# make
alias mj='make -j$(nproc)'
alias m='echo "make -j$(nproc)" && make -j$(nproc)'
alias makej='make -j$(nproc)'
alias wccache='watch -n 1 ccache -s'

# jupyter notebook
alias nb='jupyter notebook'

# repo bin
alias bin='cd $HOME/repo/bin'

# axel
alias a10='axel -n 10'
alias a20='axel -n 20'
alias a50='axel -n 50'

# pyclean
alias cleanpy='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf && rm -rf .cache'

# home
alias hoem='home'

# docker kill all
alias dkk='docker kill $(docker ps -q)'

# open3d projects
alias 3d='cd $HOME/repo/Open3D'
alias o3d='cd $HOME/repo/Open3D'
alias 3db='cd $HOME/repo/Open3D/build'
alias o3db='cd $HOME/repo/Open3D/build'

# tmux
alias tms='tmux setw synchronize-panes'
alias tch='tmux clear-history; clear; tmux clear-history'
alias tdc='tmux detach-client -a'

# virtualenv control
# alias va='. virtualenv_activate'
alias vd='deactivate'
# alias vc='virtualenv_create'

# nvidia-smi
alias smi='watch -n 1 nvidia-smi'

# sensors
alias temp='watch -n 1 echo_freq_and_temp'

# open files
alias explore='nautilus .'
alias suexplore='sudo nautilus .'

# clear
alias c='clear'

# list
alias ll='ls -alh'
alias la='ls -alh'
alias lal='ls -alh'
alias sl='ls'
cs() { cd "$1" && ls; } # possible colision with csound

# git
alias ignored='git ls-files -v | grep "^[a-z]"'
alias gitignored='git ls-files -v | grep "^[a-z]"'
alias gitdot='git -C $HOME/.dotfiles'
alias g='git'
alias gca='git commit --amend'
# alias gcam='git commit -am'
# alias gcm='git commit -m'
alias gfo='git fetch origin'
alias grom='git_rebase_origin_master'
alias grod='git_rebase_origin_develop'
alias grho='git_reset_hard_origin'
alias gdh1='git diff HEAD~1'
alias gdh2='git diff HEAD~2'
alias gits='git status'
alias gits='git status'
alias gitd='git diff'
alias grhh='git reset --hard HEAD'
alias grhh1='git reset --hard HEAD~1'
alias grh='git reset HEAD'
alias gl='git log'
alias s='git_status_or_ls'
alias d='git diff'
alias d1='git diff'
alias d2='git diff'
alias d3='git diff'
alias gd='git diff'
alias b='git branch -vv'
alias gb='git branch -vv'
alias gr='git remote -vv'

# reboot
alias reboot='sudo shutdown -r now'

# tmux
alias tmux='tmux -2'

# typo fix
alias mkae='make'
alias mxu='mux'
