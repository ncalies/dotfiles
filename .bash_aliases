
#alias sudo="sudo env PATH=$PATH"
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


this() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

alias up="git push origin `this`"
alias down="git pull origin `this`"
alias uph="git push heroku `this`"

alias meld="~/sources/meld/bin/meld"

#gem_cmd() {

#	BAD_PARAMS=91

#	cmd=$1
#	case "$cmd" in
#		'+')	cmd='install --no-rdoc --no-ri';;
#		'-')	cmd='uninstall';;
#		'^')	cmd='update';;
#		'^!')	cmd='update --system';;
#	esac

#	if [ ! -n "$cmd" ]
#	then
#		echo "You need to specify a command and options or gem names"
#		return $BAD_PARAMS
#	fi

#	shift
#	for x in $( find /opt -maxdepth 1 -type d -name 'ruby-*' ); do
#		echo "Running $cmd for $x"
#       	sudo sh -c "$x/bin/gem $cmd $@"
#	done
#}


alias gem+="sudo gem install --no-rdoc --no-ri"
alias gem-="sudo gem uninstall"
alias gem^="sudo gem update --no-rdoc --no-ri"
alias gem^!="sudo gem update --system"
alias irb="irb --readline -r irb/completion"

#alias gem+="gem_cmd +"
#alias gem-="gem_cmd -"
#alias gem^="gem_cmd ^"
#alias gem^!="gem_cmd ^!"
