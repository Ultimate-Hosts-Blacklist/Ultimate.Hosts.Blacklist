#!/bin/bash

# Linux hosts Installer for the Ultimate Hosts Blacklist
# Repo Url: https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist
# Copyright (c) 2020 Ultimate Hosts Blacklist - @Ultimate-Hosts-Blacklist
# Copyright (c) 2017, 2018, 2019, 2020 Mitchell Krog - @mitchellkrogza
# Copyright (c) 2017, 2018, 2019, 2020 Nissar Chababy - @funilrys


if [ $(id -u) -eq 0 ] ; then
    # The 'real' script:
    # First Backup Existing hosts file
    mv /etc/hosts /etc/hosts.bak
    # Now download the new hosts file and put it into place
    wget https://hosts.ubuntu101.co.za/hosts -O /etc/hosts
    exit 0
else
    # Multiple tricks to run this script as root before running the real script
    echo "This script needs to be ran as root, let's switch to root:"
    sudo=$(which sudo)
    if [ ! -z $sudo ] ; then
        $sudo $0 && exit 0
        echo "Something went wrong with trying to use 'sudo' to run this script"
        exit 1
    else
        echo "I can't find 'sudo', I'll try to use 'su' to become root."
        echo "(Remember that 'su' is deprecated, I strongly recommend installing 'sudo'.)"
        su=$(which su)
        if [ ! -z $su ] ; then
            $su -c $0 && exit 0
            echo "Something went wrong with trying to use 'su' to run this script"
            exit 1
        else
            echo "I also can't find 'su', you'll need to find another way to become root..."
            exit 1
        fi
    fi
fi
