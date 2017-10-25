#!/bin/bash
##
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <eric@truenet.com> wrote this file.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.   Eric Tykwinski
# ----------------------------------------------------------------------------
##

HOME=$(echo ~)
if [ ! -d $HOME/Documents/Quarantine ]
then
  mkdir $HOME/Documents/Quarantine
  touch $HOME/Documents/Quarantine/filelist.txt
fi
/usr/local/bin/fswatch -0 $HOME | xargs -0 -n1 -I {} /usr/local/bin/clamdscan -i --move=$HOME/Documents/Quarantine {}
