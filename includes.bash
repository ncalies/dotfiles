
# Function definitions.

if [ -f ~/.functions.bash ]; then
    . ~/.functions.bash
fi

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.aliases.bash ]; then
    . ~/.aliases.bash
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#Git auto-completion & branch name
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

#rake auto-completion
if [ -f ~/.rake.bash ]; then
    . ~/.rake.bash
fi
