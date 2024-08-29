#!/bin/bash
#File: updatediscord.sh

#format of the discord file discord-0.0.44.deb
#make a grep to check for discord-0.0.44.deb --> but do it such that it finds it in the ls
#then apply it to a variable

discord_new=$(ls $HOME/Downloads/ | grep -Eo "discord-0.0.[0-9][0-9].deb")
path_to_discord="$HOME/Downloads/$discord_new"


#checks if the path exists if not exit
if [ ! -f "$path_to_discord" ]; then
	echo "Error: $path_to_discord file not found."
	exit 1
fi

#install the discord package
#sudo dpkg -i "$path_to_discord"

#install missing dependencies
#sudo apt install -f

#clear the terminal
clear

#remove from downloads the new discord file
rm /path/to/Downloads/"$discord_new"
echo "Discord has been updated with $discord_new"
echo "Please restart your discord"


#DISCORD_URL="https://discord.com/api/download?platform=linux&format=deb"
#you have to def the path you want the deb file to be downloaded too
#then use wget -O "$DEB_FILE_PATH" "$DISCORD_URL" to actually download it

