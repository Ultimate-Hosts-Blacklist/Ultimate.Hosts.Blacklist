#!/bin/bash
# Hosts file generator for Ultimate Hosts blacklist
# Created by: Mitchell Krog (mitchellkrog@gmail.com)
# Copyright: Mitchell Krog - https://github.com/mitchellkrogza
# Repo Url: https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist

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

# ********************************************
# Re-create our previously deleted hosts files
# ********************************************

sudo touch $TRAVIS_BUILD_DIR/hosts
sudo touch $TRAVIS_BUILD_DIR/hosts.deny
sudo touch $TRAVIS_BUILD_DIR/superhosts.deny
sudo touch $TRAVIS_BUILD_DIR/hosts.windows
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

# **********************************************************
# Get Fresh Data from justdomains@mirror1.malwaredomains.com
# **********************************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_justdomains_mirror1.malwaredomains.com/domains.txt
sudo wget http://mirror1.malwaredomains.com/files/justdomains -O $TRAVIS_BUILD_DIR/.input_sources/_justdomains_mirror1.malwaredomains.com/domains.txt
sort -u $TRAVIS_BUILD_DIR/.input_sources/_justdomains_mirror1.malwaredomains.com/domains.txt -o $TRAVIS_BUILD_DIR/.input_sources/_justdomains_mirror1.malwaredomains.com/domains.txt


# *********************************************************************************************************
# Get Fresh Domains from antipopads - https://raw.githubusercontent.com/Yhonay/antipopads/master/popads.txt
# *********************************************************************************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_antipopads/*.txt
curl -sL https://raw.githubusercontent.com/Yhonay/antipopads/master/popads.txt -o $TRAVIS_BUILD_DIR/.input_sources/_antipopads/temp.txt
sed '/^\!/ d' $TRAVIS_BUILD_DIR/.input_sources/_antipopads/temp.txt > $TRAVIS_BUILD_DIR/.input_sources/_antipopads/domains.txt
sed '/^\[/ d' $TRAVIS_BUILD_DIR/.input_sources/_antipopads/domains.txt > $TRAVIS_BUILD_DIR/.input_sources/_antipopads/temp.txt
sed 's/^||//' $TRAVIS_BUILD_DIR/.input_sources/_antipopads/temp.txt > $TRAVIS_BUILD_DIR/.input_sources/_antipopads/domains.txt 
cut -d'^' -f-1 $TRAVIS_BUILD_DIR/.input_sources/_antipopads/domains.txt > $TRAVIS_BUILD_DIR/.input_sources/_antipopads/temp.txt 
mv $TRAVIS_BUILD_DIR/.input_sources/_antipopads/temp.txt $TRAVIS_BUILD_DIR/.input_sources/_antipopads/domains.txt
sort -u $TRAVIS_BUILD_DIR/.input_sources/_antipopads/domains.txt -o $TRAVIS_BUILD_DIR/.input_sources/_antipopads/domains.txt

# ***************************************************************************************************************************************
# Get Fresh Domains from HOSTS AdBlock - https://raw.githubusercontent.com/eladkarako/hosts.eladkarako.com/master/build/hosts_adblock.txt
# This Data Source Allows you one download per day !!! Reverting to static list for now.
# ***************************************************************************************************************************************

#sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_HOSTS_AdBlock/*.txt
#curl -sL https://raw.githubusercontent.com/eladkarako/hosts.eladkarako.com/master/build/hosts_adblock.txt -o $TRAVIS_BUILD_DIR/.input_sources/_HOSTS_AdBlock/temp.txt
#sed '/^\[/ d' $TRAVIS_BUILD_DIR/.input_sources/_HOSTS_AdBlock/domains.txt > $TRAVIS_BUILD_DIR/.input_sources/_HOSTS_AdBlock/temp.txt
#sed 's/^||//' $TRAVIS_BUILD_DIR/.input_sources/_HOSTS_AdBlock/temp.txt > $TRAVIS_BUILD_DIR/.input_sources/_HOSTS_AdBlock/domains.txt 
#cut -d'^' -f-1 $TRAVIS_BUILD_DIR/.input_sources/_HOSTS_AdBlock/domains.txt > $TRAVIS_BUILD_DIR/.input_sources/_HOSTS_AdBlock/temp.txt 
#mv $TRAVIS_BUILD_DIR/.input_sources/_HOSTS_AdBlock/temp.txt $TRAVIS_BUILD_DIR/.input_sources/_HOSTS_AdBlock/domains.txt
#sort -u $TRAVIS_BUILD_DIR/.input_sources/_HOSTS_AdBlock/domains.txt -o $TRAVIS_BUILD_DIR/.input_sources/_HOSTS_AdBlock/domains.txt

# ***************************************************************************************************************************
# Get Fresh Data from _Michael_Trimms_Hosts - https://raw.githubusercontent.com/michaeltrimm/hosts-blocking/master/_hosts.txt
# ***************************************************************************************************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_Michael_Trimms_Hosts/*.txt
sudo wget https://raw.githubusercontent.com/michaeltrimm/hosts-blocking/master/_hosts.txt -O $TRAVIS_BUILD_DIR/.input_sources/_Michael_Trimms_Hosts/domains.txt
cat $TRAVIS_BUILD_DIR/.input_sources/_Michael_Trimms_Hosts/domains.txt | grep -v '#' | cut -d ' ' -f2 | sed '/^$/d' > $TRAVIS_BUILD_DIR/.input_sources/_Michael_Trimms_Hosts/temp_domains.txt && mv $TRAVIS_BUILD_DIR/.input_sources/_Michael_Trimms_Hosts/temp_domains.txt $TRAVIS_BUILD_DIR/.input_sources/_Michael_Trimms_Hosts/domains.txt
sort -u $TRAVIS_BUILD_DIR/.input_sources/_Michael_Trimms_Hosts/domains.txt -o $TRAVIS_BUILD_DIR/.input_sources/_Michael_Trimms_Hosts/domains.txt

# ********************************************************************************************************************************
# Get Fresh Data from Spam404 - http://www.spam404.com/ | https://raw.githubusercontent.com/Dawsey21/Lists/master/adblock-list.txt
# ********************************************************************************************************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_Spam404/*.txt
curl -sL https://raw.githubusercontent.com/Dawsey21/Lists/master/adblock-list.txt -o $TRAVIS_BUILD_DIR/.input_sources/_Spam404/temp.txt
sed '/^\!/ d' $TRAVIS_BUILD_DIR/.input_sources/_Spam404/temp.txt > $TRAVIS_BUILD_DIR/.input_sources/_Spam404/domains.txt
sed '/^\[/ d' $TRAVIS_BUILD_DIR/.input_sources/_Spam404/domains.txt > $TRAVIS_BUILD_DIR/.input_sources/_Spam404/temp.txt
sed 's/^||//' $TRAVIS_BUILD_DIR/.input_sources/_Spam404/temp.txt > $TRAVIS_BUILD_DIR/.input_sources/_Spam404/domains.txt 
sed '/^\#/ d' $TRAVIS_BUILD_DIR/.input_sources/_Spam404/domains.txt > $TRAVIS_BUILD_DIR/.input_sources/_Spam404/temp.txt
cut -d'^' -f-1 $TRAVIS_BUILD_DIR/.input_sources/_Spam404/temp.txt > $TRAVIS_BUILD_DIR/.input_sources/_Spam404/domains.txt 
ed -s $TRAVIS_BUILD_DIR/.input_sources/_Spam404/domains.txt <<< w
sort -u $TRAVIS_BUILD_DIR/.input_sources/_Spam404/domains.txt -o $TRAVIS_BUILD_DIR/.input_sources/_Spam404/domains.txt

# *************************************************************************************************************
# Get Fresh Domains from ransomwaretracker.abuse.ch - https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt
# *************************************************************************************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_ransomwaretracker.abuse.ch/*.txt
curl -sL https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt -o $TRAVIS_BUILD_DIR/.input_sources/_ransomwaretracker.abuse.ch/temp.txt
sed '/^\#/ d' $TRAVIS_BUILD_DIR/.input_sources/_ransomwaretracker.abuse.ch/temp.txt > $TRAVIS_BUILD_DIR/.input_sources/_ransomwaretracker.abuse.ch/domains.txt
sort -u $TRAVIS_BUILD_DIR/.input_sources/_ransomwaretracker.abuse.ch/domains.txt -o $TRAVIS_BUILD_DIR/.input_sources/_ransomwaretracker.abuse.ch/domains.txt

# **********************************************************
# Get Fresh Domains from yoyo.org
# **********************************************************

#sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/domains.txt
#sudo wget 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=nohtml&showintro=0&startdate%5Bday%5D=01&startdate%5Bmonth%5D=01&startdate%5Byear%5D=2000&mimetype=plaintext' -O $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/domains.txt
#sort -u $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/domains.txt -o $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/domains.txt

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

# ******************************************
# Trim Empty Line at Beginning of Input File
# ******************************************

grep '[^[:blank:]]' < $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt > $TRAVIS_BUILD_DIR/.input_sources/combined-list-tmp.txt
sudo mv $TRAVIS_BUILD_DIR/.input_sources/combined-list-tmp.txt $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# ********************************************************
# Clean the list of any lines not containing a . character
# ********************************************************

cat $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt | sed '/\./!d' > $TRAVIS_BUILD_DIR/.input_sources/temp_combined-list.txt && mv $TRAVIS_BUILD_DIR/.input_sources/temp_combined-list.txt $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# **************************************************************************************
# Strip out our Dead Domains / Whitelisted Domains and False Positives from CENTRAL REPO
# **************************************************************************************

_combinedlist=$TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# *********************************************************************************************************************************************************
# First Run our Cleaner to remove all Dead Domains from https://github.com/mitchellkrogza/CENTRAL-REPO.Dead.Inactive.Whitelisted.Domains.For.Hosts.Projects
# *********************************************************************************************************************************************************

printf '\n%s\n%s\n%s\n\n' "##########################" "Stripping out Dead Domains" "##########################"

sudo wget https://raw.githubusercontent.com/mitchellkrogza/CENTRAL-REPO.Dead.Inactive.Whitelisted.Domains.For.Hosts.Projects/master/dead-domains.txt -O $TRAVIS_BUILD_DIR/.input_sources/___False-Positives-Dead-Domains/dead-domains.txt

_deaddomains=$TRAVIS_BUILD_DIR/.input_sources/___False-Positives-Dead-Domains/dead-domains.txt
_deadtemp=$TRAVIS_BUILD_DIR/.input_sources/___False-Positives-Dead-Domains/temp_dead_domains.txt

sort -u $_deaddomains -o $_deaddomains
sort -u $_combinedlist -o $_combinedlist

awk 'NR==FNR{a[$0];next} !($0 in a)' $_deaddomains $_combinedlist > $_deadtemp && mv $_deadtemp $_combinedlist

sort -u $_combinedlist -o $_combinedlist

printf '\n%s\n%s\n%s\n\n' "###############################" "END: Stripping out Dead Domains" "###############################"

# *******************************************************************************************************************************************************************
# Run our Cleaner to remove all False Positive Domains from https://github.com/mitchellkrogza/CENTRAL-REPO.Dead.Inactive.Whitelisted.Domains.For.Hosts.Projects
# *******************************************************************************************************************************************************************

printf '\n%s\n%s\n%s\n\n' "####################################" "Stripping out False Positive Domains" "####################################"

sudo wget https://raw.githubusercontent.com/mitchellkrogza/CENTRAL-REPO.Dead.Inactive.Whitelisted.Domains.For.Hosts.Projects/master/false-positives.txt -O $TRAVIS_BUILD_DIR/.input_sources/___False-Positives-Dead-Domains/false-positives.txt

_falsepositives=$TRAVIS_BUILD_DIR/.input_sources/___False-Positives-Dead-Domains/false-positives.txt
_falsepositivestemp=$TRAVIS_BUILD_DIR/.input_sources/___False-Positives-Dead-Domains/temp_false_positives.txt

sort -u $_falsepositives -o $_falsepositives

awk 'NR==FNR{a[$0];next} !($0 in a)' $_falsepositives $_combinedlist > $_falsepositivestemp && mv $_falsepositivestemp $_combinedlist

sort -u $_combinedlist -o $_combinedlist

printf '\n%s\n%s\n%s\n\n' "#########################################" "END: Stripping out False Positive Domains" "#########################################"

# *******************************************************************************************************************************************************************
# Run our Cleaner to remove all Whitelisted Domains from https://github.com/mitchellkrogza/CENTRAL-REPO.Dead.Inactive.Whitelisted.Domains.For.Hosts.Projects
# *******************************************************************************************************************************************************************

printf '\n%s\n%s\n%s\n\n' "#################################" "Stripping out Whitelisted Domains" "#################################"

sudo wget https://raw.githubusercontent.com/mitchellkrogza/CENTRAL-REPO.Dead.Inactive.Whitelisted.Domains.For.Hosts.Projects/master/whitelist-domains.txt -O $TRAVIS_BUILD_DIR/.input_sources/___False-Positives-Dead-Domains/whitelist-domains.txt

_whitelist=$TRAVIS_BUILD_DIR/.input_sources/___False-Positives-Dead-Domains/whitelist-domains.txt
_whitelisttemp=$TRAVIS_BUILD_DIR/.input_sources/___False-Positives-Dead-Domains/temp_whitelisted.txt

sort -u $_whitelist -o $_whitelist

awk 'NR==FNR{a[$0];next} !($0 in a)' $_whitelist $_combinedlist > $_whitelisttemp && mv $_whitelisttemp $_combinedlist

sort -u $_combinedlist -o $_combinedlist

printf '\n%s\n%s\n%s\n\n' "######################################" "END: Stripping out Whitelisted Domains" "######################################"

# ************************************************
# Activate Dos2Unix One Last Time and Re-Sort List
# ************************************************

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

#sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips.txt
#sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips-unclean.txt
#sudo wget 'https://pgl.yoyo.org/adservers/iplist.php?ipformat=plainwithhosts&showintro=0&mimetype=plaintext' -O $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips-unclean.txt
#sed 's/   #//g' $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips-unclean.txt > $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips.txt
#sort -u $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips.txt -o $TRAVIS_BUILD_DIR/.input_sources/_yoyo.org/ips.txt

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

# ******************************************
# Trim Empty Line at Beginning of Input File
# ******************************************

grep '[^[:blank:]]' < $TRAVIS_BUILD_DIR/.input_sources/combined-ips.txt > $TRAVIS_BUILD_DIR/.input_sources/combined-ips-tmp.txt
sudo mv $TRAVIS_BUILD_DIR/.input_sources/combined-ips-tmp.txt $TRAVIS_BUILD_DIR/.input_sources/combined-ips.txt

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
_inputdb4=/tmp/hostswindows.db

# ***********************************
# Declare template and temp variables
# ***********************************

_tmphostsA=tmphostsA
_tmphostsB=tmphostsB
_tmphostsC=tmphostsC
_tmphostsD=tmphostsD
_tmphostsE=tmphostsE

# *******************************
# Get our template files prepared
# *******************************

_hostsbare=$TRAVIS_BUILD_DIR/.dev-tools/hosts.template.bare
_hostswindowsbare=$TRAVIS_BUILD_DIR/.dev-tools/hosts.windows.template.bare
_hostsdenybare=$TRAVIS_BUILD_DIR/.dev-tools/hostsdeny.template.bare
_superhostsdenybare=$TRAVIS_BUILD_DIR/.dev-tools/superhostsdeny.template.bare

_hosts=$TRAVIS_BUILD_DIR/.dev-tools/hosts.template
_hostswindows=$TRAVIS_BUILD_DIR/.dev-tools/hosts.windows.template
_hostsdeny=$TRAVIS_BUILD_DIR/.dev-tools/hostsdeny.template
_superhostsdeny=$TRAVIS_BUILD_DIR/.dev-tools/superhostsdeny.template

sudo cp $_hostsbare $_hosts
sudo cp $_hostswindowsbare $_hostswindows
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

# ***********************************************************
# PRINT DATE AND TIME OF LAST UPDATE into hosts file for Unix
# ***********************************************************

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

# *************************************
# Insert hosts into hosts file for Unix
# *************************************

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

# **************************************************************
# PRINT DATE AND TIME OF LAST UPDATE into hosts file for Windows
# **************************************************************

printf '%s\n%s%s\n%s%s\n%s' "$_startmarker" "#### Version: " "$MY_GIT_TAG" "#### Total Hosts: " "$_BAD_REFERRERS_TOTAL" "$_endmarker" >> "$_tmphostsA"
mv $_tmphostsA $_inputdbA
ed -s $_inputdbA<<\IN
1,/##### Version Information #/d
/##### Version Information ##/,$d
,d
.r /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hosts.windows.template
/##### Version Information #/x
.t.
.,/##### Version Information ##/-d
w /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hosts.windows.template
q
IN
rm $_inputdbA

# ****************************************
# Insert hosts into hosts file for Windows
# ****************************************

printf '%s\n' "$_start1" >> "$_tmphostsB"
while IFS= read -r LINE
do
printf '%s%s\n' "127.0.0.1 " "${LINE}" >> "$_tmphostsB"
done < $_input1
printf '%s\n' "$_end1"  >> "$_tmphostsB"
mv $_tmphostsB $_inputdb1
ed -s $_inputdb1<<\IN
1,/# START HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###/d
/# END HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###/,$d
,d
.r /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hosts.windows.template
/# START HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###/x
.t.
.,/# END HOSTS LIST ### DO NOT EDIT THIS LINE AT ALL ###/-d
w /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/.dev-tools/hosts.windows.template
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

# ******************************************************
# Convert hosts file into Dos format for Windows Systems
# ******************************************************

sudo cp $_hostswindows $TRAVIS_BUILD_DIR/hosts.windows
sudo unix2dos $TRAVIS_BUILD_DIR/hosts.windows

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
sudo rm $_hostswindows

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