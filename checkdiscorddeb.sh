#!/bin/bash

#setting variables

#where to get the deb from
DISCORD_URL="https://discord.com/api/download?platform=linux&format=deb"
#the path to get the current verison that the discord on your computer is on.
path_to_version_info="/usr/share/discord/resources/build_info.json"
#get the current version of discord on your computer
CURRENT_VERSION=$(grep '"version":' $path_to_version_info | awk -F'"' '{print $4}')
#the dir you want the deb to be downloaded in
DISCORD_DOWNLOAD="$HOME/Downloads/newdiscord.deb"

#Download the latest .deb file
wget -O $DISCORD_DOWNLOAD $DISCORD_URL

#Get the version of discord downloaded .deb file
LATEST_VERSION=$(dpkg-deb -I $DISCORD_DOWNLOAD | grep Version | awk '{print $2}')

echo "URL:$DISCORD_URL PATHtoVer:$path_to_version_info CurrentV:$CURRENT_VERSION DownloadLOC:$DISCORD_DOWNLOAD LatestV:$LATEST_VERSION"


