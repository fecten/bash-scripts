#!/bin/bash
#File: updatediscord.sh

#format of the discord file discord-0.0.44.deb
#make a grep to check for discord-0.0.44.deb --> but do it such that it finds it in the ls
#then apply it to a variable

my_home="/home/adam"
#discord_new=$(ls $HOME/Downloads/ | grep -Eo "discord-0.0.[0-9][0-9].deb")
path_to_discord="$my_home/Downloads/new_discord.deb"


#checks if the path exists if not exit this is a fail safe this will 99% of the time never occur

if [ ! -f "$path_to_discord" ]; then
	echo "Error: $path_to_discord file not found."
	exit 1
fi

#install the discord package
dpkg -i "$path_to_discord"

