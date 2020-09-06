#!/bin/bash

# Linux hosts Installer for the Ultimate Hosts Blacklist
# Repo Url: https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist
# Copyright - Mitchell Krog - mitchellkrog@gmail.com 
# https://github.com/mitchellkrogza

#
# root has to run the script
#
if [[ $(id -u -n) != "root" ]]
    then
    printf "You need to be root to do this!\nIf you have SUDO installed, then run this script with `sudo ${0}`"
    exit 1
fi

# First Backup Existing hosts file
sudo mv /etc/hosts /etc/hosts.bak

# Now download the new hosts file and put it into place
sudo wget https://hosts.ubuntu101.co.za/hosts -O /etc/hosts

exit 0
