#!/bin/bash
# Hosts file generator for Ultimate Hosts blacklist
# Created by: Mitchell Krog (mitchellkrog@gmail.com)
# Copyright: Mitchell Krog - https://github.com/mitchellkrogza
# Repo Url: https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist

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
# Re-create our previously deleted hosts files
# ********************************************

sudo touch $TRAVIS_BUILD_DIR/hosts
sudo touch $TRAVIS_BUILD_DIR/hosts.deny
sudo touch $TRAVIS_BUILD_DIR/superhosts.deny
ls -la $TRAVIS_BUILD_DIR/

# ********************************
# ********************************
# Get Fresh Data From Some Sources
# ********************************
# ********************************

# ***********************************
# Get Fresh Data from Badd-Boyz-Hosts
# ***********************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_BaddBoyzHosts/domains.txt
sudo wget https://raw.githubusercontent.com/mitchellkrogza/Badd-Boyz-Hosts/master/PULL_REQUESTS/domains.txt -O $TRAVIS_BUILD_DIR/.input_sources/_BaddBoyzHosts/domains.txt
sort -u $TRAVIS_BUILD_DIR/.input_sources/_BaddBoyzHosts/domains.txt -o $TRAVIS_BUILD_DIR/.input_sources/_BaddBoyzHosts/domains.txt

# ********************************************
# Get Fresh Data from Hacked Malware Web Sites
# ********************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_HackedMalwareWebsites/domains.txt
sudo wget https://raw.githubusercontent.com/mitchellkrogza/The-Big-List-of-Hacked-Malware-Web-Sites/master/.dev-tools/_strip_domains/domains.txt -O $TRAVIS_BUILD_DIR/.input_sources/_HackedMalwareWebsites/domains.txt
sort -u $TRAVIS_BUILD_DIR/.input_sources/_HackedMalwareWebsites/domains.txt -o $TRAVIS_BUILD_DIR/.input_sources/_HackedMalwareWebsites/domains.txt

# **********************************************************
# Get Fresh Data from justdomains@mirror1.malwaredomains.com
# **********************************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_justdomains_mirror1.malwaredomains.com/domains.txt
sudo wget http://mirror1.malwaredomains.com/files/justdomains -O $TRAVIS_BUILD_DIR/.input_sources/_justdomains_mirror1.malwaredomains.com/domains.txt
sort -u $TRAVIS_BUILD_DIR/.input_sources/_justdomains_mirror1.malwaredomains.com/domains.txt -o $TRAVIS_BUILD_DIR/.input_sources/_justdomains_mirror1.malwaredomains.com/domains.txt

# **********************************************************
# Get Fresh Domains from yoyo.org
# **********************************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/domains.txt
sudo wget 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=nohtml&showintro=0&startdate%5Bday%5D=01&startdate%5Bmonth%5D=01&startdate%5Byear%5D=2000&mimetype=plaintext' -O $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/domains.txt
sort -u $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/domains.txt -o $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/domains.txt

# *****************
# Activate Dos2Unix
# *****************

dos2unix $TRAVIS_BUILD_DIR/.input_sources/*/domains.txt
dos2unix $TRAVIS_BUILD_DIR/.input_sources/*/*/domains.txt

# **********************************************************************
# Join all lists together into one big list for hosts including bad IP's
# **********************************************************************

cat $TRAVIS_BUILD_DIR/.input_sources/*/domains.txt >> $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt
cat $TRAVIS_BUILD_DIR/.input_sources/*/*/domains.txt >> $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# *****************
# Activate Dos2Unix
# *****************

dos2unix $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# ******************************
# Get Fresh Data from Badips.com
# ******************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_BadIPs.com_Level_3/ips.txt
sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_BadIPs.com_Level_4/ips.txt
sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_BadIPs.com_Level_5/ips.txt
sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_BadIPs.com_KEY/ips.txt

sudo wget -qO- http://www.badips.com/get/list/any/3?age=12 >> $TRAVIS_BUILD_DIR/.input_sources/_BadIPs.com_Level_3/ips.txt
sudo wget -qO- http://www.badips.com/get/list/any/4?age=12 >> $TRAVIS_BUILD_DIR/.input_sources/_BadIPs.com_Level_4/ips.txt
sudo wget -qO- http://www.badips.com/get/list/any/5?age=12 >> $TRAVIS_BUILD_DIR/.input_sources/_BadIPs.com_Level_5/ips.txt
sudo wget -qO- https://hosts.ubuntu101.co.za/badips.txt >> $TRAVIS_BUILD_DIR/.input_sources/_BadIPs.com_KEY/ips.txt

# **********************************************************************
# Get Fresh Data from Top-Attacking-IP-Addresses-Against-Wordpress-Sites
# **********************************************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_Top-Attacking-IP-Addresses-Against-Wordpress-Sites/ips.txt
sudo wget https://raw.githubusercontent.com/mitchellkrogza/Top-Attacking-IP-Addresses-Against-Wordpress-Sites/master/wordpress-attacking-ips.txt -O $TRAVIS_BUILD_DIR/.input_sources/_Top-Attacking-IP-Addresses-Against-Wordpress-Sites/ips.txt
sort -u $TRAVIS_BUILD_DIR/.input_sources/_Top-Attacking-IP-Addresses-Against-Wordpress-Sites/ips.txt -o $TRAVIS_BUILD_DIR/.input_sources/_Top-Attacking-IP-Addresses-Against-Wordpress-Sites/ips.txt

# **********************************************************
# Get Fresh IP data from yoyo.org
# **********************************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips.txt
sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips-unclean.txt
sudo wget 'https://pgl.yoyo.org/adservers/iplist.php?ipformat=plainwithhosts&showintro=0&mimetype=plaintext' -O $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips-unclean.txt
sed 's/   #//g' $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips-unclean.txt > $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips.txt
sort -u $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips.txt -o $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips.txt

# **********************************************************************
# Get Fresh Data from https://lists.blocklist.de/lists/all.txt
# **********************************************************************

sudo wget https://lists.blocklist.de/lists/all.txt -O $TRAVIS_BUILD_DIR/.input_sources/_www.blocklist.de/all.txt
cat $TRAVIS_BUILD_DIR/.input_sources/_www.blocklist.de/all.txt >> $TRAVIS_BUILD_DIR/.input_sources/_www.blocklist.de/ips.txt
sort -u $TRAVIS_BUILD_DIR/.input_sources/_www.blocklist.de/ips.txt -o $TRAVIS_BUILD_DIR/.input_sources/_www.blocklist.de/ips.txt

# *****************
# Activate Dos2Unix
# *****************

dos2unix $TRAVIS_BUILD_DIR/.input_sources/*/ips.txt
dos2unix $TRAVIS_BUILD_DIR/.input_sources/*/*/ips.txt

# ********************************************************
# Join all lists together into one big list for hosts.deny
# ********************************************************

cat $TRAVIS_BUILD_DIR/.input_sources/*/ips.txt >> $TRAVIS_BUILD_DIR/.input_sources/combined-ips.txt
cat $TRAVIS_BUILD_DIR/.input_sources/*/*/ips.txt >> $TRAVIS_BUILD_DIR/.input_sources/combined-ips.txt

# *****************
# Activate Dos2Unix
# *****************

dos2unix $TRAVIS_BUILD_DIR/.input_sources/combined-ips.txt

# *************************************************************
# Join all lists together into one big list for superhosts.deny
# *************************************************************

cat $TRAVIS_BUILD_DIR/.input_sources/combined-ips.txt >> $TRAVIS_BUILD_DIR/.input_sources/combined-superhosts.txt
cat $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt >> $TRAVIS_BUILD_DIR/.input_sources/combined-superhosts.txt

# *****************
# Activate Dos2Unix
# *****************

dos2unix $TRAVIS_BUILD_DIR/.input_sources/combined-superhosts.txt

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
_input3=$TRAVIS_BUILD_DIR/.input_sources/combined-superhosts.txt

# ***********************************************
# Sort lists alphabetically and remove duplicates
# ***********************************************

sort -u $_input1 -o $_input1
sort -u $_input2 -o $_input2
sort -u $_input3 -o $_input3

# **********************************************
# Get total counts from all lists
# **********************************************

_BAD_REFERRERS=$(wc -l < $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt)
_BAD_REFERRERS_TOTAL=$(LC_NUMERIC=en_US printf "%'.f\n" $_BAD_REFERRERS)

_BAD_IPS=$(wc -l < $TRAVIS_BUILD_DIR/.input_sources/combined-ips.txt)
_BAD_IPS_TOTAL=$(LC_NUMERIC=en_US printf "%'.f\n" $_BAD_IPS)

_SUPERHOSTS_IPS=$(wc -l < $TRAVIS_BUILD_DIR/.input_sources/combined-superhosts.txt)
_SUPERHOSTS_IPS_TOTAL=$(LC_NUMERIC=en_US printf "%'.f\n" $_SUPERHOSTS_IPS)

# **********************************
# Temporary database files we create
# **********************************

_inputdbA=/tmp/lastupdated.db
_inputdb1=/tmp/hosts.db
_inputdb2=/tmp/hostsdeny.db
_inputdb3=/tmp/superhostsdeny.db

# ***********************************
# Declare template and temp variables
# ***********************************

_tmphostsA=tmphostsA
_tmphostsB=tmphostsB
_tmphostsC=tmphostsC
_tmphostsD=tmphostsD

# *******************************
# Get our template files prepared
# *******************************

_hostsbare=$TRAVIS_BUILD_DIR/.dev-tools/hosts.template.bare
_hostsdenybare=$TRAVIS_BUILD_DIR/.dev-tools/hostsdeny.template.bare
_superhostsdenybare=$TRAVIS_BUILD_DIR/.dev-tools/superhostsdeny.template.bare

_hosts=$TRAVIS_BUILD_DIR/.dev-tools/hosts.template
_hostsdeny=$TRAVIS_BUILD_DIR/.dev-tools/hostsdeny.template
_superhostsdeny=$TRAVIS_BUILD_DIR/.dev-tools/superhostsdeny.template

sudo cp $_hostsbare $_hosts
sudo cp $_hostsdenybare $_hostsdeny
sudo cp $_superhostsdenybare $_superhostsdeny

# ***************************************
# Make sure Travis owns the files created
# ***************************************

sudo chown -R travis:travis $TRAVIS_BUILD_DIR
ls -la $TRAVIS_BUILD_DIR/.dev-tools/

# ***************************************************************
# Start and End Strings to Search for to do inserts into template
# ***************************************************************

_start1="# START HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###"
_end1="# END HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###"
_start2="# ##### START hosts.deny Block List # DO NOT EDIT #####"
_end2="# ##### END hosts.deny Block List # DO NOT EDIT #####"
_start3="# ##### START Super hosts.deny Block List # DO NOT EDIT #####"
_end3="# ##### END Super hosts.deny Block List # DO NOT EDIT #####"
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

printf '%s\n%s%s\n%s%s\n%s' "$_startmarker" "#### Version: " "$MY_GIT_TAG" "#### Total IP's: " "$_BAD_IPS_TOTAL" "$_endmarker" >> "$_tmphostsA"
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
1,/# ##### START hosts.deny Block List # DO NOT EDIT #####/d
/# ##### END hosts.deny Block List # DO NOT EDIT #####/,$d
,d
.r /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hostsdeny.template
/# ##### START hosts.deny Block List # DO NOT EDIT #####/x
.t.
.,/# ##### END hosts.deny Block List # DO NOT EDIT #####/-d
w /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hostsdeny.template
q
IN
rm $_inputdb2


# *******************************************************
# PRINT DATE AND TIME OF LAST UPDATE into superhosts.deny
# *******************************************************

printf '%s\n%s%s\n%s%s\n%s' "$_startmarker" "#### Version: " "$MY_GIT_TAG" "#### Total Hosts and IP's: " "$_SUPERHOSTS_IPS_TOTAL" "$_endmarker" >> "$_tmphostsA"
mv $_tmphostsA $_inputdbA
ed -s $_inputdbA<<\IN
1,/##### Version Information #/d
/##### Version Information ##/,$d
,d
.r /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/superhostsdeny.template
/##### Version Information #/x
.t.
.,/##### Version Information ##/-d
w /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/superhostsdeny.template
q
IN
rm $_inputdbA

# **************************************
# Insert hosts into superhosts.deny file
# **************************************

printf '%s\n' "$_start3" >> "$_tmphostsD"
while IFS= read -r LINE
do
printf '%s%s\n' "ALL: " "${LINE}" >> "$_tmphostsD"
done < $_input3
printf '%s\n' "$_end3"  >> "$_tmphostsD"
mv $_tmphostsD $_inputdb3
ed -s $_inputdb3<<\IN
1,/# ##### START Super hosts.deny Block List # DO NOT EDIT #####/d
/# ##### END Super hosts.deny Block List # DO NOT EDIT #####/,$d
,d
.r /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/superhostsdeny.template
/# ##### START Super hosts.deny Block List # DO NOT EDIT #####/x
.t.
.,/# ##### END Super hosts.deny Block List # DO NOT EDIT #####/-d
w /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/superhostsdeny.template
q
IN
rm $_inputdb3


# ************************************
# Copy Files into place before testing
# ************************************

sudo cp $_hosts $TRAVIS_BUILD_DIR/hosts
sudo cp $_hostsdeny $TRAVIS_BUILD_DIR/hosts.deny
sudo cp $_superhostsdeny $TRAVIS_BUILD_DIR/superhosts.deny
sudo cp $_input1 $TRAVIS_BUILD_DIR/domains.list
sudo cp $_input2 $TRAVIS_BUILD_DIR/ips.list

sudo rm $_hosts
sudo rm $_hostsdeny
sudo rm $_superhostsdeny

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