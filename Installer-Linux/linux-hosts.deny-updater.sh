#!/bin/bash

# Linux hosts.deny Updater for the Ultimate Hosts Blacklist
# Repo Url: https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist
# Copyright - Mitchell Krog - mitchellkrog@gmail.com 
# https://github.com/mitchellkrogza

# Get the latest updated hosts file and put it into place
sudo wget https://hosts.ubuntu101.co.za/hosts.deny -O /etc/hosts.deny

exit 0
