txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

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
      fi
}

function parse_ps1 {
    #echo "${bldgrn}\u@\h\[\e[00m\]:\[\e[01;36m\]\w\$(parse_git_branch)\[\e[00m\]$ "
    echo "${bldgrn}\u@\h${txtrst}:${bldcyn}\w\$(parse_git_branch)${txtrst}$ "
}
