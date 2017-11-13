#!/bin/bash
# TravisCI Package Deploy Script for the Badd Boyz Hosts
# Created by: Mitchell Krog (mitchellkrog@gmail.com)
# Copyright: Mitchell Krog - https://github.com/mitchellkrogza
# Repo Url: https://github.com/mitchellkrogza/Badd-Boyz-Hosts

###########################################################################
#            _ _   _                 _                                    #
#      /\ /\| | |_(_)_ __ ___   __ _| |_ ___                              #
#     / / \ \ | __| | '_ ` _ \ / _` | __/ _ \                             #
#     \ \_/ / | |_| | | | | | | (_| | ||  __/                             #
#      \___/|_|\__|_|_| |_| |_|\__,_|\__\___|                             #
#                      _           ___ _            _    _ _     _        #
#       /\  /\___  ___| |_ ___    / __\ | __ _  ___| | _| (_)___| |_      #
#      / /_/ / _ \/ __| __/ __|  /__\// |/ _` |/ __| |/ / | / __| __|     #
#     / __  / (_) \__ \ |_\__ \ / \/  \ | (_| | (__|   <| | \__ \ |_      #
#     \/ /_/ \___/|___/\__|___/ \_____/_|\__,_|\___|_|\_\_|_|___/\__|     #
#                                                                         #
###########################################################################

# MIT License

# Copyright (c) 2017 Mitchell Krog - mitchellkrog@gmail.com
# https://github.com/mitchellkrogza

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# ******************
# Set Some Variables
# ******************

YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)
MY_GIT_TAG=V$TRAVIS_BUILD_NUMBER.$YEAR.$MONTH.$DAY

# ***************************************
# Make Sure we are in the Build Directory
# ***************************************

cd $TRAVIS_BUILD_DIR
sudo chown -R travis:travis $TRAVIS_BUILD_DIR
git add -A
git commit -am "V$TRAVIS_BUILD_NUMBER.$YEAR.$MONTH.$DAY [ci skip]"

# *****************************************
# Push our commit and tags back to the repo
# *****************************************

sudo git push origin master

# ****************
# Update Raw Links
# ****************

sudo wget -qO- https://hosts.ubuntu101.co.za/update_hosts.php

# MIT License

# Copyright (c) 2017 Mitchell Krog - mitchellkrog@gmail.com
# https://github.com/mitchellkrogza

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.