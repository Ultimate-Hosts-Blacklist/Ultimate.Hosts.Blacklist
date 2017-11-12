#!/bin/bash

# Linux hosts Installer for the Ultimate Hosts Blacklist
# Repo Url: https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist
# Copyright - Mitchell Krog - mitchellkrog@gmail.com 
# https://github.com/mitchellkrogza

# First Backup Existing hosts file
sudo mv /etc/hosts /etc/hosts.bak

# Now download the new hosts file and put it into place
sudo wget https://hosts.ubuntu101.co.za/hosts -O /etc/hosts

exit 0
