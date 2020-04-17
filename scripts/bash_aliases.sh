bashs=~/.scripts/bash_scripts
python_scripts=~/.scripts/python_scripts

#Alias adder
alias adda=$bashs/alias_adder.sh

#Script Aliases
alias weather='python $python_scripts/weatherbot.py'

#Manual Aliases
alias la='ls -a'
alias lla='ls -al'
alias jdump='journalctl | tail -n 100 >> journalctl_`date +%d-%m-%Y`_`date +%T`.dump'

#Added Aliases
alias rmi='rm -i'
