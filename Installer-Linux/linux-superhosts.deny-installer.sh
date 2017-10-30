#!/bin/bash

# Linux superhosts.deny Installer for the Ultimate Hosts Blacklist
# Repo Url: https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist
# Copyright - Mitchell Krog - mitchellkrog@gmail.com 
# https://github.com/mitchellkrogza

# Now download the new hosts.deny file and put it into place
sudo wget https://hosts.ubuntu101.co.za/superhosts.deny -O /etc/hosts.deny

exit 0
