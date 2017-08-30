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
sudo rm $TRAVIS_BUILD_DIR/.input_sources/_Spam404/temp.txt
sort -u $TRAVIS_BUILD_DIR/.input_sources/_Spam404/domains.txt -o $TRAVIS_BUILD_DIR/.input_sources/_Spam404/domains.txt

# *************************************************************************************************************
# Get Fresh Domains from ransomwaretracker.abuse.ch - https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt
# *************************************************************************************************************

sudo truncate -s 0 $TRAVIS_BUILD_DIR/.input_sources/_ransomwaretracker.abuse.ch/*.txt
curl -sL https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt -o $TRAVIS_BUILD_DIR/.input_sources/_ransomwaretracker.abuse.ch/temp.txt
sed '/^\#/ d' $TRAVIS_BUILD_DIR/.input_sources/_ransomwaretracker.abuse.ch/temp.txt > $TRAVIS_BUILD_DIR/.input_sources/_ransomwaretracker.abuse.ch/domains.txt
sudo rm temp.txt
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

# ******************************************
# Trim Empty Line at Beginning of Input File
# ******************************************

grep '[^[:blank:]]' < $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt > $TRAVIS_BUILD_DIR/.input_sources/combined-list-tmp.txt
sudo mv $TRAVIS_BUILD_DIR/.input_sources/combined-list-tmp.txt $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# ********************************************************
# Clean the list of any lines not containing a . character
# ********************************************************

cat $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt | sed '/\./!d' > $TRAVIS_BUILD_DIR/.input_sources/temp_combined-list.txt && mv $TRAVIS_BUILD_DIR/.input_sources/temp_combined-list.txt $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# *******************************
# Strip out our Dead Domains List
# *******************************

# ****************************************************************************
# First Run our Cleaner to remove all Domains with HTTP Error Code 404 and 410
# ****************************************************************************

awk 'NR==FNR{a[$0];next} !($0 in a)' $TRAVIS_BUILD_DIR/.input_sources/.dead-domains/dead-domains-404-410.txt $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# *******************************
# Activate Dos2Unix One Last Time
# *******************************

dos2unix $TRAVIS_BUILD_DIR/.input_sources/combined-list.txt


# **********************************
# Setup input bots and referer lists
# **********************************

_input1=$TRAVIS_BUILD_DIR/.input_sources/combined-list.txt

# ***********************************************
# Sort lists alphabetically and remove duplicates
# ***********************************************

sort -u $_input1 -o $_input1

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