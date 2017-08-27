#!/bin/bash
# Write Build / Version Number into README.md
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
MY_GIT_TAG=V1.$YEAR.$MONTH.$TRAVIS_BUILD_NUMBER
ACTIVE_SITES=$(cat $TRAVIS_BUILD_DIR/.dev-tools/_funceble/output/logs/percentage/percentage.txt)

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
_tmpA=tmpA

# ***************************************************************
# Start and End Strings to Search for to do inserts into template
# ***************************************************************

_startmarker="_______________"
_endmarker="____________________"

# ****************************************
# PRINT VERSION INFORMATION INTO README.md
# ****************************************


printf '%s\n%s%s\n%s%s\n%s%s\n%s%s\n\n%s```\n%s\n```\n%s' "$_startmarker" "- Version: " "**$MY_GIT_TAG**" "- Total Bad Hosts in hosts file: " "**$_BAD_REFERRERS_TOTAL**" "- Total Bad Hosts in hosts.deny file: " "**$_BAD_IPS_TOTAL**" "- Total Bad Hosts and IP's in superhosts.deny file: " "**$_SUPERHOSTS_IPS_TOTAL**" " :exclamation: **Yes you did indeed read those numbers correctly** :exclamation: " "$ACTIVE_SITES" "$_endmarker" >> "$_tmpA"
mv $_tmpA $_inputdbA
ed -s $_inputdbA<<\IN
1,/_______________/d
/____________________/,$d
,d
.r /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/README.md
/_______________/x
.t.
.,/____________________/-d
w /home/travis/build/mitchellkrogza/Ultimate.Hosts.Blacklist/README.md
q
IN
rm $_inputdbA


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