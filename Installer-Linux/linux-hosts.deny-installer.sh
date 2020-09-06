#!/bin/bash

# Linux hosts.deny Installer for the Ultimate Hosts Blacklist
# Repo Url: https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist
# Copyright - Mitchell Krog - mitchellkrog@gmail.com 
# https://github.com/mitchellkrogza

# First Backup Existing hosts file
sudo mv /etc/hosts.deny /etc/hosts.deny.bak

# Now download the new hosts file and put it into place
sudo wget https://hosts.ubuntu101.co.za/hosts.deny -O /etc/hosts.deny

exit 0
