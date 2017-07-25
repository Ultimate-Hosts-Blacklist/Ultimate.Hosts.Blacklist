#!/bin/bash
# Hosts file generator for Badd Boyz Hosts
# Created by: Mitchell Krog (mitchellkrog@gmail.com)
# Copyright: Mitchell Krog - https://github.com/mitchellkrogza
# Repo Url: https://github.com/mitchellkrogza/Badd-Boyz-Hosts

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
MY_GIT_TAG=V1.$YEAR.$MONTH.$TRAVIS_BUILD_NUMBER
#BAD_REFERRERS=$(wc -l < $TRAVIS_BUILD_DIR/PULL_REQUESTS/domains.txt)

# *****************************************
# Join all lists together into one big list
# *****************************************

cat $TRAVIS_BUILD_DIR/.input_sources/*/domains >> $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# Setup input bots and referer lists
#_input1=$TRAVIS_BUILD_DIR/PULL_REQUESTS/domains.txt
_input2=$TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# Temporary database files we create
_inputdbA=/tmp/lastupdated.db
_inputdb1=/tmp/hosts.db

# Declare template and temp variables
_hosts=$TRAVIS_BUILD_DIR/travisCI/hosts.template
_tmphostsA=tmphostsA
_tmphostsB=tmphostsB

# Sort lists alphabetically and remove duplicates
#sort -u $_input1 -o $_input1
sort -u $_input2 -o $_input2

# Start and End Strings to Search for to do inserts into template
#_start1="# START HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###"
#_end1="# END HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###"
#_startmarker="##### Version Information #"
#_endmarker="##### Version Information ##"

# PRINT DATE AND TIME OF LAST UPDATE
# **********************************
#LASTUPDATEIFS=$IFS
#IFS=$'\n'
#now="$(date)"
#echo $_startmarker >> $_tmphostsA
#printf "###################################################\n### Version: "$MY_GIT_TAG"\n### Updated: "$now"\n### Bad Host Count: "$BAD_REFERRERS"\n###################################################\n" >> $_tmphostsA
#echo $_endmarker  >> $_tmphostsA
#IFS=$LASTUPDATEIFS
#mv $_tmphostsA $_inputdbA
#ed -s $_inputdbA<<\IN
#1,/##### Version Information #/d
#/##### Version Information ##/,$d
#,d
#.r /home/travis/build/mitchellkrogza/Badd-Boyz-Hosts/travisCI/hosts.template
#/##### Version Information #/x
#.t.
#.,/##### Version Information ##/-d
#w /home/travis/build/mitchellkrogza/Badd-Boyz-Hosts/travisCI/hosts.template
#q
#IN
#rm $_inputdbA

# ****************************
# Insert hosts into hosts file
# ****************************

#HOSTS=$IFS
#IFS=$'\n'
#echo $_start1 >> $_tmphostsB
#for line in $(cat $_input1); do
#printf "0.0.0.0 ${line}\n" >> $_tmphostsB
#done
#echo $_end1  >> $_tmphostsB
#IFS=$HOSTS
#mv $_tmphostsB $_inputdb1
#ed -s $_inputdb1<<\IN
#1,/# START HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###/d
#/# END HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###/,$d
#,d
#.r /home/travis/build/mitchellkrogza/Badd-Boyz-Hosts/travisCI/hosts.template
#/# START HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###/x
#.t.
#.,/# END HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###/-d
#w /home/travis/build/mitchellkrogza/Badd-Boyz-Hosts/travisCI/hosts.template
#q
#IN
#rm $_inputdb1

# ************************************
# Copy Files into place before testing
# ************************************
#sudo mv /etc/hosts /etc/hosts.bak2
#sudo cp $_hosts /etc/hosts
#sudo cp $_hosts $TRAVIS_BUILD_DIR/hosts
exit 0

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