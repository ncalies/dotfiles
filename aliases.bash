alias free="free -m"
alias update="sudo apt-get update"
alias install="sudo apt-get install"
alias upgrade="sudo apt-get upgrade"
alias remove="sudo apt-get remove"
alias l="ls -lahF"
alias lv="vim -R"
alias up!="update && upgrade"
alias gv="gvim . &>/dev/null"
alias ..="cd .."
alias ...="cd ../.."
alias cdr="cd .. && cd -"

alias u="unicorn -p 5000"
alias ur="unicorn_rails -p 3000"

alias gst="git status --ignore-submodules=dirty"
alias gd="git diff"
alias gdt="git difftool"
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
alias gg="gitg &"
alias conflicts="git ls-files --unmerged | cut -f2 | uniq"

alias up="git push origin `parse_git_this_branch`"
alias down="git pull origin `parse_git_this_branch`"
alias uph="git push heroku `parse_git_this_branch`"
alias downh="git pull heroku `parse_git_this_branch`"

alias rbx^="rvm reinstall rbx -- --enable-version=1.8 --default-version=1.9"
alias rbxci="bin/mspec tag --list fails :ci_files -tx19"
alias cdrbx="cd ~/projects/rubinius/rubinius"
alias r="rails"
alias rs="r s"
alias rg="r g"
alias rc="r c"
alias rt="rake test"
alias rtu="rake test:units"
alias rtf="rake test:functionals"
alias rti="rake test:integration"
alias rit="ruby -Itest"
alias mac="rake db:migrate && rake db:test:clone"
alias b="bundle exec"

alias gem+="gem install --no-rdoc --no-ri"
alias gem-="gem uninstall"
alias gem^="gem update --no-rdoc --no-ri"
alias gem^!="gem update --system"
