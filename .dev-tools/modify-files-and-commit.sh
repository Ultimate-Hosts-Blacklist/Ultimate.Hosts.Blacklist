#!/bin/bash
# Travis CI Generating Script for Badd Boyz hosts File
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

YEAR=$(date +"%Y")
MONTH=$(date +"%m")
cd $TRAVIS_BUILD_DIR

# *******************************
# Remove Remote Added by TravisCI
# *******************************

git remote rm origin

# **************************
# Add Remote with Secure Key
# **************************

git remote add origin https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git

# **********************************************************************************
# List Remotes ONLY DURING testing - do not do this on live repo / possible key leak
# git remote -v
# ***********************************************************************************

# *********************
# Set Our Git Variables
# *********************

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git config --global push.default simple

# *******************************************
# Make sure we have checked out master branch
# *******************************************

git checkout master

# ***************************************************
# Make all script files executable
# ***************************************************

sudo chmod +x $TRAVIS_BUILD_DIR/.dev-tools/deploy-package.sh
sudo chmod +x $TRAVIS_BUILD_DIR/.dev-tools/modify-readme.sh
sudo chmod +x $TRAVIS_BUILD_DIR/.dev-tools/ping-test.sh

# ***********************************************
# Update Our Readme File with Version Information
# ***********************************************

sudo $TRAVIS_BUILD_DIR/.dev-tools/modify-readme.sh

# **************************************
# Zip Our Release to Keep the Repo Small
# **************************************

cd $TRAVIS_BUILD_DIR/

zip -r hosts.zip hosts
zip -r hosts.windows.zip hosts.windows
zip -r hosts.deny.zip hosts.deny
zip -r superhosts.deny.zip superhosts.deny
zip -r domains.list.zip domains.list
zip -r ips.list.zip ips.list


# *******************************
# Remove our unzipped hosts files
# *******************************

sudo rm $TRAVIS_BUILD_DIR/hosts
sudo rm $TRAVIS_BUILD_DIR/hosts.windows
sudo rm $TRAVIS_BUILD_DIR/hosts.deny
sudo rm $TRAVIS_BUILD_DIR/superhosts.deny
sudo rm $TRAVIS_BUILD_DIR/domains.list
sudo rm $TRAVIS_BUILD_DIR/ips.list

# **************************************************
# Truncate our input lists before committing to repo
# **************************************************

#sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt
sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/combined-ips.txt
sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/combined-superhosts.txt

# *************************************
# Add all the modified files and commit
# *************************************

sudo git add -A
sudo git commit -am "V1.$YEAR.$MONTH.$TRAVIS_BUILD_NUMBER [ci skip]"

# *********************
# Push back to the repo
# *********************

sudo git push origin master

# *************************************************************
# Travis now moves to the before_deploy: section of .travis.yml
# *************************************************************

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