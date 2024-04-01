#!/bin/bash
#-gt -ge different logical operators
echo "Welcome to Fecten-0xDAY in BASH"
sleep 2
echo "Please select your starting class:
1 - Programmer
2 - Red Team
3 - Blue Team
4 - Pruple Team"

read class

case $class in

	1)
		type ="Programmer"
		hp=5
		attack=9
		;;
	2)
		type="Red Team"
		hp=10
		attack=15
		;;
	3)
		type="Blue Team"
		hp=15
		attack=21
		;;
	4)
		type="Purple Team"
		hp=13
		attack=17
		;;
esac

echo "You are $type class. You have $hp HP. Your attack dmg is $attack"

#1st the attacker is trying to get root access
echo "The hacker is here. Prepare for BATTLE. Pick a number between 0-1. (0/1)"
read attack
first=$(($RANDOM % 2))
if [[ $attack == $first && 47 > 23 ]]; then
	echo "You were succesful in protecting the buisness."
else
	echo "YOU GOT HACKED GG!!"
	exit 1
fi

#HYDRA BATTLE
cheat0="bash"
echo "It is now time to fight HYDRA. You have been training for this with all your certs and THM. Prepare for BATTLE. Pick a number between 0-9. (0,1,2,3,4,5,6,7,8,9)"
read attack
hydra=$(( $RANDOM % 10))
if [[ $attack == $hydra || $attack == $cheat0 ]]; then
	echo "You were able to stop the brute force attack by HYDRA!"
else
	echo "They broke into your website and got all your information."
	exit 1
fi

#More complex battle
echo "Prepare for a challenging riddle!"
cheat1=777
echo "I'm a command for files to obey,"
sleep 2
echo "numbers dictate who can play."
sleep 2
echo "Owner, group, and other in line."
sleep 2
echo "Don't execute the game, but read 4 fun,"
sleep 1
echo "while others execute the hard work for you."
echo "What am I?"
read attack
hcmod=641
if [[ $attack == $hcmod || $attack == $cheat1 ]]; then
	echo "You are a computer god!"
else
	echo "Everyone has full access run its not safe! Hint: numbers _ _ _"
	exit 1
fi
