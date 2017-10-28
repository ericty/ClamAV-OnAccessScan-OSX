#!/bin/bash
##
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <eric@truenet.com> wrote this file.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.   Eric Tykwinski
# ----------------------------------------------------------------------------
##

DATE=`date +%Y-%m-%d:%H:%M:%S`
FILENAME=$(basename $CLAM_VIRUSEVENT_FILENAME)
DIR=$(echo $CLAM_VIRUSEVENT_FILENAME | sed -E 's/'"$FILENAME"'//g')
OWNER=$(stat -f %Su $DIR)
HOME=$(eval echo "~$OWNER")
UID=$(id -u $OWNER))
sudo -u "$OWNER" echo "$DATE $CLAM_VIRUSEVENT_FILENAME $CLAM_VIRUSEVENT_VIRUSNAME" >> "$HOME/Documents/Quarantine/filelist.txt"
## Closest I've found, but doesn't work
## launchctl asuser "$UID" /usr/bin/osascript -e "display notification \"$CLAM_VIRUSEVENT_FILENAME\" with Title \"ClamAV - $CLAM_VIRUSEVENT_VIRUSNAME\""
