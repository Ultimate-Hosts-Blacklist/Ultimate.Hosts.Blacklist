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

# *****************************************
# Join all lists together into one big list
# *****************************************

cat $TRAVIS_BUILD_DIR/.input_sources/*/domains >> $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# ******************
# Set Some Variables
# ******************

YEAR=$(date +%Y)
MONTH=$(date +%m)
MY_GIT_TAG=V1.$YEAR.$MONTH.$TRAVIS_BUILD_NUMBER
BAD_REFERRERS=$(wc -l < $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt)


# Setup input bots and referer lists
_input1=$TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# Sort lists alphabetically and remove duplicates
sort -u $_input1 -o $_input1

# Temporary database files we create
_inputdbA=/tmp/lastupdated.db
_inputdb1=/tmp/hosts.db

# Declare template and temp variables
_hosts=$TRAVIS_BUILD_DIR/.dev-tools/hosts.template
_tmphostsA=tmphostsA
_tmphostsB=tmphostsB


# Start and End Strings to Search for to do inserts into template
_start1="# START HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###"
_end1="# END HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###"
_startmarker="##### Version Information #"
_endmarker="##### Version Information ##"

# PRINT DATE AND TIME OF LAST UPDATE
# **********************************
#printf '%s\n' "$_start2" >> "$_tmphostsA"
#while IFS= read -r LINE
#do
#printf '%s\n%s%s\n%s%s\n%s' "$_startmarker" "#### Version: " "$MY_GIT_TAG" "#### Total Hosts: " "$BAD_REFERRERS" "$_end2" >> "$_tmphostsA"
#done
#printf '%s\n' "$_end1"  >> "$_tmphostsA"
#mv $_tmphostsA $_inputdbA
#ed -s $_inputdbA<<\IN
#1,/##### Version Information #/d
#/##### Version Information ##/,$d
#,d
#.r /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hosts.template
#/##### Version Information #/x
#.t.
#.,/##### Version Information ##/-d
#w /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hosts.template
#q
#IN
#rm $_inputdbA

# ****************************
# Insert hosts into hosts file
# ****************************

printf '%s\n' "$_start1" >> "$_tmphostsB"
while IFS= read -r LINE
do
printf '%s%s\n' "0.0.0.0 " "${LINE}" >> "$_tmphostsB"
done < $_input1
printf '%s\n' "$_end1"  >> "$_tmphostsB"
mv $_tmphostsB $_inputdb1
ed -s $_inputdb1<<\IN
1,/# START HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###/d
/# END HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###/,$d
,d
.r /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hosts.template
/# START HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###/x
.t.
.,/# END HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###/-d
w /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hosts.template
q
IN
rm $_inputdb1

# ************************************
# Copy Files into place before testing
# ************************************
sudo mv /etc/hosts /etc/hosts.bak2
sudo cp $_hosts /etc/hosts
sudo cp $_hosts $TRAVIS_BUILD_DIR/hosts
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