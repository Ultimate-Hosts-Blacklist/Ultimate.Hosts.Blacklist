#!/bin/bash

# Linux superhosts.deny Installer for the Ultimate Hosts Blacklist
# Repo Url: https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist
# Copyright (c) 2020 Ultimate Hosts Blacklist - @Ultimate-Hosts-Blacklist
# Copyright (c) 2017, 2018, 2019, 2020 Mitchell Krog - @mitchellkrogza
# Copyright (c) 2017, 2018, 2019, 2020 Nissar Chababy - @funilrys

# Now download the new hosts.deny file and put it into place
sudo wget https://hosts.ubuntu101.co.za/superhosts.deny -O /etc/hosts.deny

exit 0
