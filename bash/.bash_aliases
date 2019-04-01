alias install='sudo -E apt-get install'
alias search='sudo -E apt-cache search'

alias gr='grep -nri --color=always'
alias ..='cd ..'

alias up='svn up'
alias st='svn st'
alias revert='svn revert -R'
alias merge='svn merge'
alias dif='svn diff | gvim -'

# This creates a temporary function wrapper, which is passed the arguments.
# Alias arguments are only passed at the end. Note that wrapper is called
# at the very end of the alias. The unset -f removes the function definition
# as the alias is executed so it doesn't hang around afterwards.
#
# solution form:
#    https://unix.stackexchange.com/questions/3773/how-to-pass-parameters-to-an-alias
#
alias fo='wrapper(){ ~/bin/findAndOpen $1 $2; unset -f wrapper; }; wrapper'


