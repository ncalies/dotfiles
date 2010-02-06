alias free="free -m"
alias update="sudo aptitude update"
alias install="sudo aptitude install"
alias upgrade="sudo aptitude safe-upgrade"
alias remove="sudo aptitude remove"
alias l="ls -lah"
alias up!="update && upgrade"
alias ack="ack-grep"

alias u="unicorn -p 4567"
alias ur="unicorn_rails -p 3000"


alias up="git push origin `parse_git_this_branch`"
alias down="git pull origin `parse_git_this_branch`"
alias uph="git push heroku `parse_git_this_branch`"

alias meld="~/sources/meld/bin/meld"

alias gem+="sudo gem install --no-rdoc --no-ri"
alias gem-="sudo gem uninstall"
alias gem^="sudo gem update --no-rdoc --no-ri"
alias gem^!="sudo gem update --system"
alias irb="irb --readline -r irb/completion"
