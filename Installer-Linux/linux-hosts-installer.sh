#!/bin/bash

# Linux hosts Installer for the Ultimate Hosts Blacklist
# Repo Url: https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist
# Copyright (c) 2020 Ultimate Hosts Blacklist - @Ultimate-Hosts-Blacklist
# Copyright (c) 2017, 2018, 2019, 2020 Mitchell Krog - @mitchellkrogza
# Copyright (c) 2017, 2018, 2019, 2020 Nissar Chababy - @funilrys

#
# root has to run the script
#
if [[ $(id -u) != 0 ]]
    then
    printf "You need to be root to do this!\nIf you have SUDO installed, then run this script with `sudo ${0}`"
    exit 1
fi

# First Backup Existing hosts file
sudo mv /etc/hosts /etc/hosts.bak

# Now download the new hosts file and put it into place
sudo wget https://hosts.ubuntu101.co.za/hosts -O /etc/hosts

exit 0
