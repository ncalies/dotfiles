# vim:set ft=sh sw=2 sts=2:

txtred="\[\e[0;31m\]" # Red
txtgrn="\[\e[0;32m\]" # Green
txtpur="\[\e[0;35m\]" # Purple
txtblu="\[\e[0;34m\]" # Blue
bldgrn="\[\e[1;32m\]" # Green
bldcyn="\[\e[1;36m\]" # Cyan
txtrst="\[\e[0m"    # Text Reset

function parse_git_this_branch {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function parse_git_deleted {
      [[ $(git status 2> /dev/null | grep deleted:) != "" ]] && echo "-"
}
function parse_git_added {
      [[ $(git status 2> /dev/null | grep "Untracked files:") != "" ]] && echo '+'
}
function parse_git_modified {
      [[ $(git status 2> /dev/null | grep modified:) != "" ]] && echo "*"
}
function parse_git_dirty {
      echo "$(parse_git_added)$(parse_git_modified)$(parse_git_deleted)"
}
function parse_git_branch {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}
function parse_ps1 {
    #echo "${txtgrn}\u@\h:${bldcyn}\w${txtrst} $(parse_git_branch)> "
    echo "${txtgrn}\u@\h\[\033[00m\]:${bldcyn}\w\[\033[00m\]\$(parse_git_branch)$ "
}

export CLICOLOR=1
export LSCOLORS=gxgxcxdxbxegedabagacad

export CLICOLOR LSCOLORS
