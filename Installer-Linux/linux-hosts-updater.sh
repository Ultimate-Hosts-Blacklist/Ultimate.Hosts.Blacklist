#!/bin/bash

# Linux hosts Updater for the Ultimate Hosts Blacklist
# Repo Url: https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist
# Copyright - Mitchell Krog - mitchellkrog@gmail.com 
# https://github.com/mitchellkrogza

# Get the latest updated hosts file and put it into place
sudo wget https://hosts.ubuntu101.co.za/hosts -O /etc/hosts

exit 0
