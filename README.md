# The Ultimate Hosts Blacklist for all Unix, Linux and Windows Operating Systems

<img src="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/ultimate-hosts-blacklist-logo.png" alt="The Ultimate Hosts File blacklist to Protect your Children, Your Family and Yourself from accessing Bad Web Sites"/><img src="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/spacer.jpg"/>[![Build Status](https://travis-ci.org/mitchellkrogza/Ultimate.Hosts.Blacklist.svg?branch=master)](https://travis-ci.org/mitchellkrogza/Ultimate.Hosts.Blacklist)<img src="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/spacer.jpg"/>[![DUB](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/LICENSE.md)<img src="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/spacer.jpg"/><a href='https://twitter.com/ubuntu101za'><img src='https://img.shields.io/twitter/follow/ubuntu101za.svg?style=social&label=Follow' alt='Follow @ubuntu101za'></a>

#### UPDATED DAILY :exclamation:

The Ultimate hosts file for protecting your computer or device against over several hundred thousand bad web sites. 
Protect your children and family from gaining access to bad web sites and protect your devices and pc from being infected with Malware or Ransomware.

A hosts file for use on any operating system to block bad domains out of your servers or devices. Information gathered from multiple sources and merged into one massive hosts file and updated every day.

_______________
- Version: **V1.924.2018.01.09**
- Total Bad Hosts in hosts file: **1,599,004**
- Total Bad IP's in hosts.deny file: **101,270**
- Total Bad Hosts and IP's in superhosts.deny file: **1,700,273**

 :exclamation: **Yes you did indeed read those numbers correctly** :exclamation: 
____________________


Click the link below to see all the sources used as input data to create this hosts list.
### [SOURCES OF INPUT DATA USED TO CREATE THIS HOSTS FILE](#information-data-sources)

************************************************
## RAW FILE SOURCES

The links below will direct you to the raw unzipped versions of the hosts files in this repo. (Files are updated daily)

| File Name       | Operating System | Format  | Download Link |
| -------------   |:---------------: | :-----: |  :----------- |
| hosts           | Unix/Linux       | UNIX    | <a href="https://hosts.ubuntu101.co.za/hosts">Download</a><br/> |
| hosts           | Windows          | CRLF/DOS| <a href="https://hosts.ubuntu101.co.za/hosts.windows">Download</a> |
| hosts.deny      | Unix/Linux       | UNIX    | <a href="https://hosts.ubuntu101.co.za/hosts.deny">Download</a><br/> |
| superhosts.deny | Unix/Linux       | UNIX    | <a href="https://hosts.ubuntu101.co.za/superhosts.deny">Download</a><br/> |
| domains.list    | Any / Pi-Hole    | UNIX    | <a href="https://hosts.ubuntu101.co.za/domains.list">Download</a><br/> |
| domains-dotted-format.list    | DnsMasq          | UNIX    | <a href="https://hosts.ubuntu101.co.za/domains-dotted-format.list">Download</a><br/> |
| ips.list        | Any / Pi-Hole    | UNIX    | <a href="https://hosts.ubuntu101.co.za/ips.list">Download</a> |

### Installers, Updaters and Uninstaller Helper Scripts

| Linux | Windows |
| ----- | ------- |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-installer.sh">hosts Installer</a> | <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-install-hosts.bat">hosts Installer</a> |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-uninstaller.sh">hosts UnInstaller</a> | <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-update-hosts.bat">hosts Updater</a> |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-updater.sh">hosts Updater</a> | <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-uninstall-hosts.bat">hosts UnInstaller</a> |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-installer.sh">hosts.deny Installer</a> |  |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-uninstaller.sh">hosts.deny UnInstaller</a> |  |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-updater.sh">hosts.deny Updater</a> |  |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-installer.sh">superhosts.deny Installer</a> |  | 
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-uninstaller.sh">superhosts.deny UnInstaller</a> |  | 
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-updater.sh">superhosts.deny Updater</a> |   |
 
************************************************
## WHAT IS A HOSTS FILE?

A hosts file, named `hosts` (with no file extension), is a plain-text file
used by all operating systems to map hostnames to IP addresses.

In most operating systems, the `hosts` file is preferential to `DNS`.
Therefore if a domain name is resolved by the `hosts` file, the request never
leaves your computer.

Having a smart `hosts` file goes a long way towards blocking malware, adware, ransomware, porn and other nuisance web sites.

A hosts file like this causes any lookups to any of the listed domains to resolve back to your localhost so it prevents any outgoing connections to the listed domains.

For example, to drop all requests to certain domains or servers, adding lines to your hosts file as below will achieve this for you. You can create your own custom hosts or simply use ours which covers you for well over 1 million bad domains and web sites out there.

```
# Block Bad Domains and Servers with Hosts File
0.0.0.0 doubleclick.net
0.0.0.0 18chinese.com
0.0.0.0 gatekeeper.tss.net
0.0.0.0 www.gatekeeper.tss.net
0.0.0.0 cdn.gatekeeper.tss.net
0.0.0.0 youporn.com
0.0.0.0 www.youporn.com
0.0.0.0 x-lime.net
0.0.0.0 www.x-lime.net
# etc ... etc .... etc ...
```

It is important to note that a `hosts` file cannot understand wild card domains. So adding `0.0.0.0 *.doubleclick.net` will not work. You must specify each and every variation of a domain name that is in use and up to no good. 

Lucky for you our massive hosts file compiled from over 25 independent data input sources already does this for you. 
So it is as simple as downloading our `hosts` file and keeping it up to date as we update the hosts file several times a week as new threats emerg.

************************************************

## RECOMMENDATION FOR USING`0.0.0.0` instead of `127.0.0.1`

Most host files traditionally use 127.0.0.1 as the loopback address, to establish an IP connection to the local machine.

I prefer the use of 0.0.0.0, which is defined as a non-routable meta-address. Using 0.0.0.0 is also faster because there's no wait for a timeout resolution. 
It also does not interfere with any web servers that may be running on the local system.

For many windows operating systems however 127.0.0.1 does appear to work slightly better and which is why our Windows version of the hosts file uses 127.0.0.1 as the loopback address.

************************************************
## WHAT IS A HOSTS.DENY FILE?

A hosts file, named `hosts.deny` is a plain-text file for Linux/Unix based operating systems only which blocks a list of IP addresses on the outside of your network from gaining any access to your computer. A `hosts.deny` file will not work on a Windows operating system.

************************************************
## WHAT IS A SUPERHOSTS.DENY FILE? **I've never heard of such a thing ??**

The superhosts.deny file is simply named `superhosts.deny` but is actually just a normal `hosts.deny` file which is a plain-text file for Linux/Unix based operating systems which blocks a list of IP addresses or hosts (domains) on the outside of your network from gaining any access to your computer. If you want to user this `superhosts.deny` file simply rename it to `hosts.deny` and place it in your `/etc/` folder on your Linux/Unix operating system. A `hosts.deny` file will not work on a Windows operating system.

************************************************
## WHERE DO I PUT THIS ON MY COMPUTER?

To modify your current `hosts` file, look for it in the following places and modify it with a text
editor. 

**PLEASE NOTE:** On all operating systems you need administrative access to modify the hosts file. You can Google on how to do this for your particular operating system.

**Linux, Mac OS X, iOS, Android**: `/etc/hosts`

**Linux, Mac OS X, iOS, Android**: `/etc/hosts.deny`

**Windows Systems**: `%SystemRoot%\system32\drivers\etc\hosts`
**<a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/windows-install-hosts.bat">Try the Windows Installer Batch Script</a><br/>**

************************************************
## WHERE CAN I DOWNLOAD THE RAW UNZIPPED FILES FROM?

To keep this Github repo small, all files are provided in a zip only format. Some people however require their Pi-Holes or other systems to automatically download a raw file once a week or so as an update. For your convenience you can download these raw files at the following links. These links below will always contain the latest updated version of these files. (Files are updated daily)

| File Name       | Operating System | Format  | Download Link |
| -------------   |:---------------: | :-----: |  :----------- |
| hosts           | Unix/Linux       | UNIX    | <a href="https://hosts.ubuntu101.co.za/hosts">Download</a><br/> |
| hosts           | Windows          | CRLF/DOS| <a href="https://hosts.ubuntu101.co.za/hosts.windows">Download</a> |
| hosts.deny      | Unix/Linux       | UNIX    | <a href="https://hosts.ubuntu101.co.za/hosts.deny">Download</a><br/> |
| superhosts.deny | Unix/Linux       | UNIX    | <a href="https://hosts.ubuntu101.co.za/superhosts.deny">Download</a><br/> |
| domains.list    | Any / Pi-Hole    | UNIX    | <a href="https://hosts.ubuntu101.co.za/domains.list">Download</a><br/> |
| domains-dotted-format.list    | DnsMasq          | UNIX    | <a href="https://hosts.ubuntu101.co.za/domains-dotted-format.list">Download</a><br/> |
| ips.list        | Any / Pi-Hole    | UNIX    | <a href="https://hosts.ubuntu101.co.za/ips.list">Download</a> |
 
### Installers, Updaters and Uninstaller Helper Scripts

| Linux | Windows |
| ----- | ------- |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-installer.sh">hosts Installer</a> | <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-install-hosts.bat">hosts Installer</a> |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-uninstaller.sh">hosts UnInstaller</a> | <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-update-hosts.bat">hosts Updater</a> |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-updater.sh">hosts Updater</a> | <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-uninstall-hosts.bat">hosts UnInstaller</a> |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-installer.sh">hosts.deny Installer</a> |  |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-uninstaller.sh">hosts.deny UnInstaller</a> |  |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-updater.sh">hosts.deny Updater</a> |  |
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-installer.sh">superhosts.deny Installer</a> |  | 
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-uninstaller.sh">superhosts.deny UnInstaller</a> |  | 
| <a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-updater.sh">superhosts.deny Updater</a> |   |

************************************************
## ADDITIONS / REMOVALS / CORRECTIONS !!

[![Log an Issue](https://img.shields.io/badge/LOG%20-%20an%20issue%20%F0%9F%9A%A6-blue.svg)](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/issues) if you disagree with anything on this list or want to add any other bad web sites to the list.

You can also fork a copy of this repo, create a new unique folder in .input_sources, call your file domains.txt and simply send a Pull Request to the repository and it will be added.

************************************************
## INFORMATION DATA SOURCES, COPYRIGHTS AND CREDITS

### CREDITS & THANKS

This hosts files is generated from multiple input sources, collated, sorted for duplicates and merged into one single hosts file.

The sources of the input data information are as follows.

- [2o7.net](https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts)
- [Adblock No-Coin List](https://github.com/hoshsadiq/adblock-nocoin-list/blob/master/hosts.txt)
- [MoaAB adblock.makala.is](http://adblock.mahakala.is/)
- [add.Risk](https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts)
- [add.Spam](https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Spam/hosts)
- [lists.disconnect.me](https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt)
- [Airelle's Anti-Sex Hosts](http://rlwpx.free.fr/WPFF/hsex.7z)
- [Anti-PopAds](https://raw.githubusercontent.com/Yhonay/antipopads/master/popads.txt)
- [Bad JAV Sites](https://pastebin.com/raw/kDqbYwWr)
- [Badd Boyz Hosts](https://github.com/mitchellkrogza/Badd-Boyz-Hosts)
- [BadIPS.com](https://www.badips.com/)
- [Firehol](https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level1.netset)
- [Hosts ADBlock](https://raw.githubusercontent.com/eladkarako/hosts.eladkarako.com/master/build/hosts_adblock.txt)
- [JustDomains](http://mirror1.malwaredomains.com/files/justdomains)
- [KADHosts](https://raw.githubusercontent.com/azet12/KADhosts/master/KADhosts.txt)
- [malc0de](http://malc0de.com/bl/)
- [Malware Domain List](https://www.malwaredomainlist.com/hostslist/hosts.txt)
- [Michael Trimm's Hosts](https://raw.githubusercontent.com/michaeltrimm/hosts-blocking/master/_hosts.txt)
- [pl-host file](https://raw.githubusercontent.com/xxcriticxx/.pl-host-file/master/hosts.txt)
- [Quidsup NoTrack](https://raw.githubusercontent.com/quidsup/notrack/master/trackers.txt)
- [Ransomware Tracker Domain Blocklist](https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt)
- [ShallaList](http://www.shallalist.de/)
- [somewhocares.org](http://someonewhocares.org/hosts/)
- [Spam404](https://raw.githubusercontent.com/Dawsey21/Lists/master/adblock-list.txt)
- [Top Attacking Wordpress IP's](https://github.com/mitchellkrogza/Top-Attacking-IP-Addresses-Against-Wordpress-Sites)
- [Blocklist.de](http://www.blocklist.de/en/index.html)
- [YoYo.org](https://pgl.yoyo.org/as/serverlist.php?showintro=0;hostformat=hosts)
- [ZeusTracker](https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist)
- [uBlock Filters Plus](https://raw.githubusercontent.com/IDKwhattoputhere/uBlock-Filters-Plus/master/uBlock-Filters-Plus.txt)
- [YousList - smartadserver and mirrors](https://github.com/yous/YousList)
- [SMed79 - Various Lists](https://github.com/SMed79)
- [ZeroDot1 - CoinBlocker Lists](https://github.com/ZeroDot1/CoinBlockerLists)

************************************************
## COLLABORATORS & CONTRIBUTORS

- [Nissar Chababy](https://github.com/funilrys)
- [Maravento](https://github.com/maravento)
- [xxcriticxx](https://github.com/xxcriticxx)
- [SMed79](https://github.com/SMed79)
- [ZeroDot1](https://github.com/ZeroDot1)

************************************************
## Please Help Support this Project

[![Help me out with a mug of beer](https://img.shields.io/badge/Help%20-%20me%20out%20with%20a%20mug%20of%20%F0%9F%8D%BA-blue.svg)](https://paypal.me/mitchellkrog/) or [![Help me feed my cat](https://img.shields.io/badge/Help%20-%20me%20feed%20my%20hungry%20cat%20%F0%9F%98%B8-blue.svg)](https://paypal.me/mitchellkrog/)

************************************************
## Some other awesome free projects

- https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker
- https://github.com/mitchellkrogza/apache-ultimate-bad-bot-blocker
- https://github.com/mitchellkrogza/Badd-Boyz-Hosts
- https://github.com/mitchellkrogza/Stop.Google.Analytics.Ghost.Spam.HOWTO
- https://github.com/mitchellkrogza/fail2ban-useful-scripts
- https://github.com/mitchellkrogza/linux-server-administration-scripts
- https://github.com/mitchellkrogza/Travis-CI-Nginx-for-Testing-Nginx-Configuration
- https://github.com/mitchellkrogza/Travis-CI-for-Apache-For-Testing-Apache-and-PHP-Configurations
- https://github.com/mitchellkrogza/Fail2Ban-Blacklist-JAIL-for-Repeat-Offenders-with-Perma-Extended-Banning
- https://github.com/funilrys/funceble
- https://github.com/funilrys/dead-hosts
************************************************
## Support this Project

[![Help me out with a mug of beer](https://img.shields.io/badge/Help%20-%20me%20out%20with%20a%20mug%20of%20%F0%9F%8D%BA-blue.svg)](https://paypal.me/mitchellkrog/) or [![Help me feed my cat](https://img.shields.io/badge/Help%20-%20me%20feed%20my%20hungry%20cat%20%F0%9F%98%B8-blue.svg)](https://paypal.me/mitchellkrog/)

<img src="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/zuko.png"/>

************************************************
### Into Photography?

Come drop by and visit me at https://mitchellkrog.com

************************************************
# MIT License

## Copyright (c) 2017 Mitchell Krog - mitchellkrog@gmail.com
## https://github.com/mitchellkrogza

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
