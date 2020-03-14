# scripts


`
# Credits and Description for Bash_Prompt

##	+-----------------------------------+-----------------------------------+
##	|                                                                       |
##	|                            FANCY BASH PROMT                           |
##	|                                                                       |
##	| Copyright (c) 2018, Andres Gongora <mail@andresgongora.com>.          |
##	|                                                                       |
##	| This program is free software: you can redistribute it and/or modify  |
##	| it under the terms of the GNU General Public License as published by  |
##	| the Free Software Foundation, either version 3 of the License, or     |
##	| (at your option) any later version.                                   |
##	|                                                                       |
##	| This program is distributed in the hope that it will be useful,       |
##	| but WITHOUT ANY WARRANTY; without even the implied warranty of        |
##	| MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         |
##	| GNU General Public License for more details.                          |
##	|                                                                       |
##	| You should have received a copy of the GNU General Public License     |
##	| along with this program. If not, see <http://www.gnu.org/licenses/>.  |
##	|                                                                       |
##	+-----------------------------------------------------------------------+


##
##	DESCRIPTION:
##	This script updates your "PS1" environment variable to display colors.
##	Addicitionally, it also shortens the name of your current part to maximum
##	25 characters, which is quite useful when working in deeply nested folders.
##
##
##
##	INSTALLATION:
##	Copy this script to your home folder and rename it to ".fancy-bash-promt.sh"
##	Run this command from any terminal: 
##		echo "source ~/.fancy-bash-promt.sh" >> ~/.bashrc
##
##	Alternatively, copy the content of this file into your .bashrc file
##
##
##
##	FUNCTIONS:
##
##	* bash_prompt_command()
##	  This function takes your current working directory and stores a shortened
##	  version in the variable "NEW_PWD".
##
##	* format_font()
##	  A small helper function to generate color formating codes from simple
##	  number codes (defined below as local variables for convenience).
##
##	* bash_prompt()
##	  This function colorizes the bash promt. The exact color scheme can be
##	  configured here. The structure of the function is as follows:
##		1. A. Definition of available colors for 16 bits.
##		1. B. Definition of some colors for 256 bits (add your own).
##		2. Configuration >> EDIT YOUR PROMT HERE<<.
##		4. Generation of color codes.
##		5. Generation of window title (some terminal expect the first
##		   part of $PS1 to be the window title)
##		6. Formating of the bash promt ($PS1).
##
##	* Main script body:	
##	  It calls the adequate helper functions to colorize your promt and sets
##	  a hook to regenerate your working directory "NEW_PWD" when you change it.
## 




################################################################################
##  FUNCTIONS                                                                 ##
################################################################################

##
##	ARRANGE $PWD AND STORE IT IN $NEW_PWD
##	* The home directory (HOME) is replaced with a ~
##	* The last pwdmaxlen characters of the PWD are displayed
##	* Leading partial directory names are striped off
##		/home/me/stuff -> ~/stuff (if USER=me)
##		/usr/share/big_dir_name -> ../share/big_dir_name (if pwdmaxlen=20)
##
##	Original source: WOLFMAN'S color bash promt
##	https://wiki.chakralinux.org/index.php?title=Color_Bash_Prompt#Wolfman.27s
##   	
`
