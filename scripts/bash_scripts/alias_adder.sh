#! /bin/bash
read -p "Alias: " alias_name
read -p "Content: " alias_content
alias_adder="alias $alias_name='$alias_content'"

echo $alias_adder >> ~/.scripts/bash_aliases.sh
