# Files
[ -f ./bash_functions.sh ] && . ./bash_functions.sh || echo 'Function file does not exist' 

#Script Aliases
alias adda=$bashs/alias_adder.sh
alias backup='bash $bashs/backup.sh'

#Manual Aliases
alias la='ls -a'
alias lla='ls -al'
#alias cross='$HOME/opt/cross-compiler/bin/i686-elf-gcc'

#Added Aliases
alias rmi='rm -i'
