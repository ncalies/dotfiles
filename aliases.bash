alias free="free -m"
alias update="sudo apt-get update"
alias install="sudo apt-get install"
alias upgrade="sudo apt-get upgrade"
alias remove="sudo apt-get remove"
alias l="ls -lahF"
alias lv="vim -R"
alias up!="update && upgrade"
alias gv="gvim . &>/dev/null"
alias gimp="gimpbox"
alias pencil="xulrunner ~/sources/pencil/application.ini &>/dev/null &"

alias u="unicorn -p 4567"
alias ur="unicorn_rails -p 3000"

alias gst="git status --ignore-submodules=dirty"
alias gd="git diff"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gb="git branch"
alias gba="git branch -a"
alias gm="git merge"
alias gmv="git mv"
alias ga="git add"
alias gco="git checkout"
alias gsr="git svn rebase"
alias gsd="git svn dcommit"

alias up="git push origin `parse_git_this_branch`"
alias down="git pull origin `parse_git_this_branch`"
alias uph="git push heroku `parse_git_this_branch`"

alias r="./script/rails"
alias rs="r s"
alias rg="r g"
alias rc="r c"
alias rt="rake test"
alias rtu="rake test:units"
alias rtf="rake test:functionals"
alias rti="rake test:integration"
alias rit="ruby -Itest"
alias mac="rake db:migrate && rake db:test:clone"

alias gem+="gem install --no-rdoc --no-ri"
alias gem-="gem uninstall"
alias gem^="gem update --no-rdoc --no-ri"
alias gem^!="gem update --system"
