# vim:set ft=sh sw=2 sts=2:

txtred='\[\e[0;31m' # Red
txtgrn='\[\e[0;32m' # Green
txtpur='\[\e[0;35m' # Purple
txtblu='\[\e[0;34m\]' # Blue
bldgrn='\[\e[1;32m\]' # Green
bldcyn='\[\e[1;36m\]' # Cyan
txtrst='\[\e[0m'    # Text Reset

function parse_git_this_branch {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function parse_git_deleted {
      [[ $(git status 2> /dev/null | grep deleted:) != "" ]] && echo "${txtred}-"
}
function parse_git_added {
      [[ $(git status 2> /dev/null | grep "Untracked files:") != "" ]] && echo "${txtgrn}+"
}
function parse_git_modified {
      [[ $(git status 2> /dev/null | grep modified:) != "" ]] && echo "${txtpur}*"
}
function parse_git_dirty {
      echo -e "$(parse_git_added)$(parse_git_deleted)$(parse_git_modified)"
}
function parse_git_branch {
      if [ -n "$(__git_ps1)" ]
      then
        local result=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/")
        echo -e "${txtblu}($result${txtblu})"
        #echo -e "($result${txtrst})"
      fi
}

function parse_ps1 {
    #echo "${bldgrn}\u@\h${txtrst}:${bldcyn}\w\$(parse_git_branch)${txtrst}\$ "
    #echo -e "\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(parse_git_branch)$ "
    echo "${txtgrn}\]\u@\h:${bldcyn}\w${txtrst}> "
    #echo "\[\e]2;\u@\h: \w\a${bldgrn}\]>${txtrst}\]"
}
