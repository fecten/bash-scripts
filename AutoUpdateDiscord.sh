#!/bin/bash

#setting variables

my_home="/home/adam"
#where to get the deb from
DISCORD_URL="https://discord.com/api/download?platform=linux&format=deb"
#the path to get the current verison that the discord on your computer is on.
path_to_version_info="/usr/share/discord/resources/build_info.json"
#get the current version of discord on your computer
CURRENT_VERSION=$(grep '"version":' $path_to_version_info | awk -F'"' '{print $4}')
#getting the latest version
LATEST_VERSION=$(curl -sI $DISCORD_URL | grep -oP '(?<=/)\d+\.\d+\.\d+(?=/discord)')
#the dir you want the deb to be downloaded in
DISCORD_DOWNLOAD="$my_home/Downloads/discord-$LATEST_VERSION.deb"




if [ "$LATEST_VERSION" != "$CURRENT_VERSION" ]; then
    echo "New Discord version detected: $LATEST_VERSION"

    #Get the discord.deb file with the current version and correct file name
    wget -O $DISCORD_DOWNLOAD $DISCORD_URL

    #Fail safe just to make sure that the file exists if it doesn't then it exits
    if [ ! -f "$DISCORD_DOWNLOAD" ]; then
	echo "Error: $path_to_discord file not found."
	exit 1
    fi

    #Install the discord package over the current version
    dpkg -i "$DISCORD_DOWNLOAD"

    #Kill Discord
    #Specify -15 to gracfully kill discord SIGTERM(15)
    #SIGTERM (15): Gracefully terminate.
    #SIGKILL (9): Forcefully kill immediately.
    #SIGINT (2): Interrupt interactively.
    #SIGHUP (1): Hang up or reload.
    #SIGQUIT (3): Quit with core dump.
    #SIGSTOP (19): Pause.
    #SIGCONT (18): Resume.
    #SIGUSR1/2: Custom signals for user-defined actions.
    killall -15 Discord

    #Need to restart discord without a hangup and have it run in the background such that it does not interrupt the current shell.
    #So we use nohup
    #discord to specify the service
    #&> redirect stdout and stderr to a file or device in this case /dev/null
    # & at the end runs it in the background.
    nohup discord &>/dev/null &

    #Clean Up
    rm $DISCORD_DOWNLOAD

else
    echo "Discord is up to date."

fi

#Check
echo "Latest: $LATEST_VERSION | Current: $CURRENT_VERSION"



