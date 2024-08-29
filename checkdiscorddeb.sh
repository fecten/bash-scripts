#!/bin/bash

#setting variables

my_home="/home/adam"
#where to get the deb from
DISCORD_URL="https://discord.com/api/download?platform=linux&format=deb"
#the path to get the current verison that the discord on your computer is on.
path_to_version_info="/usr/share/discord/resources/build_info.json"
#get the current version of discord on your computer
CURRENT_VERSION=$(grep '"version":' $path_to_version_info | awk -F'"' '{print $4}')
#the dir you want the deb to be downloaded in
DISCORD_DOWNLOAD="$my_home/Downloads/newdiscord.deb"

#Download the latest .deb file
wget -O $DISCORD_DOWNLOAD $DISCORD_URL

#Get the version of discord downloaded .deb file
LATEST_VERSION=$(dpkg-deb -I $DISCORD_DOWNLOAD | grep Version | awk '{print $2}')


if [ "$LATEST_VERSION" != "$CURRENT_VERSION" ]; then
    echo "New Discord version detected: $LATEST_VERSION"

    #Run the updatediscord script
    bash $my_home/Documents/proj_scripts/bash_scripts/updatediscord.sh

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
else
    echo "Discord is up to date."

fi

#Clean up
rm $DISCORD_DOWNLOAD
echo "URL:$DISCORD_URL PATHtoVer:$path_to_version_info CurrentV:$CURRENT_VERSION DownloadLOC:$DISCORD_DOWNLOAD LatestV:$LATEST_VERSION"


