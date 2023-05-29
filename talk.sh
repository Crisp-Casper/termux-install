#!/usr/bin/env bash

sed -i 's/shortcut/# shortcut/g' ~/.termux/termux.properties
PS3='Please enter your choice: 1.Talk 2.Yell 3:Quit   '
options=("Talk" "Yell" "Quit")
select opt in "${options[@]}"
do
   case $opt in
	"Talk")
		clear
		read -p "You are now talking: " my_var
        	#clear    	
		echo $my_var | espeak -s 145
		;;
	"Yell")
		clear
		read -p "You are now Yelling: " my_var
        	clear    	
		echo $my_var | espeak -s 145 -a 200
		;;
	"Quit")
		break
		;;
        *) echo "invalid option $REPLY";;
    esac
sed -i 's/# shortcut/shortcut/g' ~/.termux/termux.properties
done
