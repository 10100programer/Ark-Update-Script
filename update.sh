#!/bin/sh
## ARK Update Script ##

## DATE FORMAT ##
NOW=$(date +"%b-%d-%Y-%I-%M")
Month=$(date +"%B")
year=$(date +"%Y")

## Check Premisions ##
if [ ! "`whoami`" = "root" ]
then
    echo "\nPlease run script as root."
    exit 1
fi

## Splash Screen ##
figlet ark survival update script
sleep 4
clear

##-BACKUP AERA-##
echo -n "Starting Backup..."
cd /srv/ark_backups
tar -cvfj $NOW.tar.bz2 /srv/ark #Make Bzip2 Archive
clear
sleep 4
figlet Starting Steam Update

##-UPDATE AERA-##
steamcmd +login anonymous +force_install_dir /srv/ark/ +app_update 376030 +quit
exit
##EOF##
