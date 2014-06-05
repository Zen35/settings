# bash
PS1="[\d \t \u@\h:\w ] $ "

# zsh
#PS1="[%W %t %n@M:%. ] $ "


source ~/git-completion.bash

alias gap='git ap'
alias gbr='git br'
alias gci='git ci'
alias gcm='git cm'
alias gco='git co'
alias gdf='git df'
alias gdc='git dc'
alias gdt='git dt'
alias gdtc='git dtc'
alias glg='git lg'
alias glol='git lol'
alias glola='git lola'
alias gls='git ls'
alias gst='git st'
alias gus='git us'
alias gcp='git cp'

alias dir='echo `pwd` | pbcopy'

alias marked='open -a Marked'

export PATH=$PATH:/usr/local/apps
export PATH=$PATH:/Users/nhirsch/scripts
export PATH=$PATH:/usr/local/Cellar/ruby/1.9.3-p327/bin
export PATH=$PATH:/Applications/p4merge.app/Contents/MacOS
export PATH=$PATH:/usr/local/share/npm/bin

export SVN_EDITOR=vim
