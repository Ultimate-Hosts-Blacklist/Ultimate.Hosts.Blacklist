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
    echo "This script needs to be ran as root, let's switch to root:" > /dev/stderr
    sudo $0 && exit 0
    if [ $? -eq 127 ] ; then
        echo "I can't find 'sudo', I'll try to use 'su' to become root." > /dev/stderr
        echo "(Remember that 'su' is considered deprecated (it needs a root password), I strongly recommend installing 'sudo'.)" > /dev/stderr
        su -c $0 && exit 0
        if [ $? -eq 127 ] ; then
            echo "I also can't find 'su', I'll try to use 'pkexec' to run this as root..." > /dev/stderr
            pkexec $0 && exit 0
            #Check for 126 because 127 is a possible returncode of 'pkexec' so it's not necessarily unavailable
            #Because of the '&&' in the command above checks for returncode 0, the else-block can only be entered in case of non-authorization-related problems
            if [ $? -eq 126 ] ; then
                echo "I can't give you authorization to run this as root, you'll need to find another way to become root..." > /dev/stderr
                exit 1
            else
                echo "Something went wrong with trying to use 'pkexec' to run this script." > /dev/stderr
                echo "It could also be that it's not installed in which case you need to install at least 'sudo', 'pkexec' or 'su'" > /dev/stderr
                exit 1
            fi
        else
            echo "Something went wrong with trying to use 'su' to run this script" > /dev/stderr
            exit 1
        fi
    else
        echo "Something went wrong with trying to use 'sudo' to run this script" > /dev/stderr
        exit 1
    fi
fi
