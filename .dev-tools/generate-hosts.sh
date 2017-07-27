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

# ********************************************
# Truncate our input list before rebuilding it
# ********************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# *****************************************
# Join all lists together into one big list
# *****************************************

cat $TRAVIS_BUILD_DIR/.input_sources/*/domains >> $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt
cat $TRAVIS_BUILD_DIR/.input_sources/_ShallaList/*/domains >> $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt
cat $TRAVIS_BUILD_DIR/.input_sources/_urlblacklist.com/*/domains >> $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# *****************************************
# Create a Bad IP list from Badips.com
# *****************************************

cat $TRAVIS_BUILD_DIR/.input_sources/_BadIPs.com*/domains >> $TRAVIS_BUILD_DIR/.input_sources/combined-ips.txt

# ******************
# Set Some Variables
# ******************

YEAR=$(date +%Y)
MONTH=$(date +%m)
MY_GIT_TAG=V1.$YEAR.$MONTH.$TRAVIS_BUILD_NUMBER

# **********************************
# Setup input bots and referer lists
# **********************************

_input1=$TRAVIS_BUILD_DIR/.input_sources/combined-list.txt
_input2=$TRAVIS_BUILD_DIR/.input_sources/combined-ips.txt

# ***********************************************
# Sort lists alphabetically and remove duplicates
# ***********************************************

sort -u $_input1 -o $_input1
sort -u $_input2 -o $_input2

# **********************************************
# Set some more variables after sorting our list
# **********************************************

_BAD_REFERRERS=$(wc -l < $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt)
_BAD_REFERRERS_TOTAL=$(LC_NUMERIC=en_US printf "%'.f\n" $_BAD_REFERRERS)

# **********************************
# Temporary database files we create
# **********************************

_inputdbA=/tmp/lastupdated.db
_inputdb1=/tmp/hosts.db
_inputdb2=/tmp/hostsdeny.db

# ***********************************
# Declare template and temp variables
# ***********************************

_hosts=$TRAVIS_BUILD_DIR/.dev-tools/hosts.template
_hostsdeny=$TRAVIS_BUILD_DIR/.dev-tools/hostsdeny.template
_tmphostsA=tmphostsA
_tmphostsB=tmphostsB
_tmphostsC=tmphostsC

# ********************************************************
# Truncate our existing hosts file before re-generating it
# ********************************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/hosts

# ***************************************************************
# Start and End Strings to Search for to do inserts into template
# ***************************************************************

_start1="# START HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###"
_end1="# END HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###"
_start2="# ##### START badips.com Block List — DO NOT EDIT #####"
_end2="# ##### END badips.com Block List - DO NOT EDIT #####"
_startmarker="##### Version Information #"
_endmarker="##### Version Information ##"

# **************************************************
# PRINT DATE AND TIME OF LAST UPDATE into hosts file
# **************************************************

printf '%s\n%s%s\n%s%s\n%s' "$_startmarker" "#### Version: " "$MY_GIT_TAG" "#### Total Hosts: " "$_BAD_REFERRERS_TOTAL" "$_endmarker" >> "$_tmphostsA"
mv $_tmphostsA $_inputdbA
ed -s $_inputdbA<<\IN
1,/##### Version Information #/d
/##### Version Information ##/,$d
,d
.r /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hosts.template
/##### Version Information #/x
.t.
.,/##### Version Information ##/-d
w /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hosts.template
q
IN
rm $_inputdbA

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

# **************************************************
# PRINT DATE AND TIME OF LAST UPDATE into hosts.deny
# **************************************************

printf '%s\n%s%s\n%s%s\n%s' "$_startmarker" "#### Version: " "$MY_GIT_TAG" "#### Total Hosts: " "$_BAD_REFERRERS_TOTAL" "$_endmarker" >> "$_tmphostsA"
mv $_tmphostsA $_inputdbA
ed -s $_inputdbA<<\IN
1,/##### Version Information #/d
/##### Version Information ##/,$d
,d
.r /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hostsdeny.template
/##### Version Information #/x
.t.
.,/##### Version Information ##/-d
w /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hostsdeny.template
q
IN
rm $_inputdbA

# *********************************
# Insert hosts into hosts.deny file
# *********************************

printf '%s\n' "$_start2" >> "$_tmphostsC"
while IFS= read -r LINE
do
printf '%s%s\n' "ALL: " "${LINE}" >> "$_tmphostsC"
done < $_input2
printf '%s\n' "$_end2"  >> "$_tmphostsC"
mv $_tmphostsC $_inputdb2
ed -s $_inputdb2<<\IN
1,/# ##### START badips.com Block List — DO NOT EDIT #####/d
/# ##### END badips.com Block List - DO NOT EDIT #####/,$d
,d
.r /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hostsdeny.template
/# ##### START badips.com Block List — DO NOT EDIT #####/x
.t.
.,/# ##### END badips.com Block List - DO NOT EDIT #####/-d
w /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hostsdeny.template
q
IN
rm $_inputdb2

# ************************************
# Copy Files into place before testing
# ************************************

sudo mv /etc/hosts /etc/hosts.bak2
sudo cp $_hosts /etc/hosts
sudo cp $_hostsdeny /etc/hosts.deny
sudo cp $_hosts $TRAVIS_BUILD_DIR/hosts
sudo cp $_hostsdeny $TRAVIS_BUILD_DIR/hosts.deny

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