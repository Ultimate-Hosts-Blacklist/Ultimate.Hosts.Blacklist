# The Ultimate Hosts Blacklist for all Unix, Linux and Windows Operating Systems - Largest Unified Hosts File in the Universe

![Unified Hosts File - Ultimate Hosts File blacklist consolidating hosts files from multiple well-curated and tested sources. Best Network Blocker to Protect your Children, Your Family and Yourself from accessing Bad Web Sites](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/ultimate-hosts-blacklist-logo.png)

| Updated | Fueled By |
| :-----: | :------: |
| Daily :heavy_check_mark: | [<img src="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/ultimate-hosts-org-small.png" alt="Hosts File - Ultimate Hosts Blacklist"/>](https://github.com/Ultimate-Hosts-Blacklist) |
| [![Build Status](https://travis-ci.org/mitchellkrogza/Ultimate.Hosts.Blacklist.svg?branch=master)](https://travis-ci.org/mitchellkrogza/Ultimate.Hosts.Blacklist) | [![DUB](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/LICENSE.md) |

The Ultimate Hosts Blacklist is undoubtedly the world's largest curated Unified Hosts file for protecting your computer or device against over several hundred thousand bad web sites. Use this Hosts File to protect your network, your children and your family from gaining access to millions of bad web sites. Protect your wifi network, computers and smartphone devices from being infected with Malware or Ransomware.

Our hosts file is for use on any operating system to block bad domains out of your servers or devices. Information is gathered from multiple sources, tested regularly and merged into one massive hosts file and updated daily.

[![Follow @ubuntu101za](https://img.shields.io/twitter/follow/ubuntu101za.svg?style=social&label=Follow)](https://twitter.com/ubuntu101za)

---

- Version: **V1.1979.2020.05.11**
- Total Bad Hosts in hosts file: **485,871**
- Total Bad IP's in hosts.deny file: **141,023**
- Total Bad Hosts and IP's in superhosts.deny file: **626,894**

  :exclamation: **Yes you did indeed read those numbers correctly** :exclamation:

---

Click the link below to see all the sources used as input data to create this hosts list.

### [SOURCES OF INPUT DATA USED TO CREATE THIS HOSTS FILE](#credits--thanks)

---

## RAW FILE SOURCES

The links below will direct you to the raw unzipped versions of the hosts files in this repo. (Files are updated daily)

| File Name                  | Operating System |  Format  | Download Link                                                            |
| -------------------------- | :--------------: | :------: | :----------------------------------------------------------------------- |
| hosts                      |    Unix/Linux    |   UNIX   | [Download](https://hosts.ubuntu101.co.za/hosts)<br>                      |
| hosts                      |     Windows      | CRLF/DOS | [Download](https://hosts.ubuntu101.co.za/hosts.windows)                  |
| hosts.deny                 |    Unix/Linux    |   UNIX   | [Download](https://hosts.ubuntu101.co.za/hosts.deny)<br>                 |
| superhosts.deny            |    Unix/Linux    |   UNIX   | [Download](https://hosts.ubuntu101.co.za/superhosts.deny)<br>            |
| domains.list               |  Any / Pi-Hole   |   UNIX   | [Download](https://hosts.ubuntu101.co.za/domains.list)<br>               |
| domains-dotted-format.list |     DnsMasq      |   UNIX   | [Download](https://hosts.ubuntu101.co.za/domains-dotted-format.list)<br> |
| ips.list                   |  Any / Pi-Hole   |   UNIX   | [Download](https://hosts.ubuntu101.co.za/ips.list)                       |

### Installers, Updaters and Uninstaller Helper Scripts

| Linux                                                                                                                                                      | Windows                                                                                                                                   |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| [hosts Installer](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-installer.sh)                         | [hosts Installer](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-install-hosts.bat)     |
| [hosts UnInstaller](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-uninstaller.sh)                     | [hosts Updater](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-update-hosts.bat)        |
| [hosts Updater](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-updater.sh)                             | [hosts UnInstaller](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-uninstall-hosts.bat) |
| [hosts.deny Installer](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-installer.sh)               |
| [hosts.deny UnInstaller](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-uninstaller.sh)           |
| [hosts.deny Updater](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-updater.sh)                   |
| [superhosts.deny Installer](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-installer.sh)     |
| [superhosts.deny UnInstaller](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-uninstaller.sh) |
| [superhosts.deny Updater](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-updater.sh)         |

---

## WHAT IS A HOSTS FILE?

A hosts file, named `hosts` (with no file extension), is a plain-text file used by all operating systems to map hostnames to IP addresses.

In most operating systems, the `hosts` file is preferential to `DNS`. Therefore if a domain name is resolved by the `hosts` file, the request never leaves your computer.

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

Lucky for you our massive hosts file compiled from over 25 independent data input sources already does this for you. So it is as simple as downloading our `hosts` file and keeping it up to date as we update the hosts file several times a week as new threats emerg.

---

## RECOMMENDATION FOR USING`0.0.0.0` instead of `127.0.0.1`

Most host files traditionally use 127.0.0.1 as the loopback address, to establish an IP connection to the local machine.

I prefer the use of 0.0.0.0, which is defined as a non-routable meta-address. Using 0.0.0.0 is also faster because there's no wait for a timeout resolution. It also does not interfere with any web servers that may be running on the local system.

For many windows operating systems however 127.0.0.1 does appear to work slightly better and which is why our Windows version of the hosts file uses 127.0.0.1 as the loopback address.

---

## WHAT IS A HOSTS.DENY FILE?

A hosts file, named `hosts.deny` is a plain-text file for Linux/Unix based operating systems only which blocks a list of IP addresses on the outside of your network from gaining any access to your computer. A `hosts.deny` file will not work on a Windows operating system.

---

## WHAT IS A SUPERHOSTS.DENY FILE? **I've never heard of such a thing ??**

The superhosts.deny file is simply named `superhosts.deny` but is actually just a normal `hosts.deny` file which is a plain-text file for Linux/Unix based operating systems which blocks a list of IP addresses or hosts (domains) on the outside of your network from gaining any access to your computer. If you want to use this `superhosts.deny` file simply rename it to `hosts.deny` and place it in your `/etc/` folder on your Linux/Unix operating system. A `hosts.deny` file will not work on a Windows operating system.

---

## WHERE DO I PUT THIS ON MY COMPUTER?

To modify your current `hosts` file, look for it in the following places and modify it with a text editor.

**PLEASE NOTE:** On all operating systems you need administrative access to modify the hosts file. You can Google on how to do this for your particular operating system.

**Linux, Mac OS X, iOS, Android**: `/etc/hosts`

**Linux, Mac OS X, iOS, Android**: `/etc/hosts.deny`

**Windows Systems**: `%SystemRoot%\system32\drivers\etc\hosts` **[Try the Windows Installer Batch Script](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/windows-install-hosts.bat)<br>**

---

## WHERE CAN I DOWNLOAD THE RAW UNZIPPED FILES FROM?

To keep this Github repo small, all files are provided in a zip only format. Some people however require their Pi-Holes or other systems to automatically download a raw file once a week or so as an update. For your convenience you can download these raw files at the following links. These links below will always contain the latest updated version of these files. (Files are updated daily)

| File Name                  | Operating System |  Format  | Download Link                                                            |
| -------------------------- | :--------------: | :------: | :----------------------------------------------------------------------- |
| hosts                      |    Unix/Linux    |   UNIX   | [Download](https://hosts.ubuntu101.co.za/hosts)<br>                      |
| hosts                      |     Windows      | CRLF/DOS | [Download](https://hosts.ubuntu101.co.za/hosts.windows)                  |
| hosts.deny                 |    Unix/Linux    |   UNIX   | [Download](https://hosts.ubuntu101.co.za/hosts.deny)<br>                 |
| superhosts.deny            |    Unix/Linux    |   UNIX   | [Download](https://hosts.ubuntu101.co.za/superhosts.deny)<br>            |
| domains.list               |  Any / Pi-Hole   |   UNIX   | [Download](https://hosts.ubuntu101.co.za/domains.list)<br>               |
| domains-dotted-format.list |     DnsMasq      |   UNIX   | [Download](https://hosts.ubuntu101.co.za/domains-dotted-format.list)<br> |
| ips.list                   |  Any / Pi-Hole   |   UNIX   | [Download](https://hosts.ubuntu101.co.za/ips.list)                       |

### Installers, Updaters and Uninstaller Helper Scripts

| Linux                                                                                                                                                      | Windows                                                                                                                                   |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| [hosts Installer](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-installer.sh)                         | [hosts Installer](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-install-hosts.bat)     |
| [hosts UnInstaller](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-uninstaller.sh)                     | [hosts Updater](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-update-hosts.bat)        |
| [hosts Updater](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-updater.sh)                             | [hosts UnInstaller](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-uninstall-hosts.bat) |
| [hosts.deny Installer](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-installer.sh)               |
| [hosts.deny UnInstaller](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-uninstaller.sh)           |
| [hosts.deny Updater](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-updater.sh)                   |
| [superhosts.deny Installer](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-installer.sh)     |
| [superhosts.deny UnInstaller](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-uninstaller.sh) |
| [superhosts.deny Updater](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-updater.sh)         |

---

## ADDITIONS / REMOVALS / CORRECTIONS !!

[![Log an Issue](https://img.shields.io/badge/LOG%20-%20an%20issue%20%F0%9F%9A%A6-blue.svg)](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/issues) if you disagree with anything on this list or want to add any other bad web sites to the list.

---

## INFORMATION DATA SOURCES, COPYRIGHTS AND CREDITS

### CREDITS & THANKS

This hosts files is generated from multiple input sources, collated, sorted for duplicates and merged into one single hosts file.

The sources of the input data information are as follows.

- [2o7.net](https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts)
- [Adblock No-Coin List](https://github.com/hoshsadiq/adblock-nocoin-list/blob/master/hosts.txt)
- [Add_Risk](https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts)
- [Add_Spam](https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Spam/hosts)
- [Ads_Disconnect.me](https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt)
- [Airelle's Anti-Sex Hosts](http://rlwpx.free.fr/WPFF/hsex.7z)
- [Anti-PopAds](https://raw.githubusercontent.com/Yhonay/antipopads/master/popads.txt)
- [AnudeepND's blacklist (ad servers)](https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt)
- [Bad JAV Sites](https://pastebin.com/raw/kDqbYwWr)
- [Badd Boyz Hosts](https://github.com/mitchellkrogza/Badd-Boyz-Hosts)
- [BadIPS.com](https://www.badips.com/)
- [Barbock filter list](https://raw.githubusercontent.com/CHEF-KOCH/BarbBlock-filter-list/master/HOSTS.txt)
- [Blocklist.de](http://www.blocklist.de/en/index.html)
- [Cameleon](http://sysctl.org/cameleon/hosts)
- [CHEF-KOCH's Spotify-Ad-free](https://raw.githubusercontent.com/CHEF-KOCH/Spotify-Ad-free/master/Spotify.txt)
- [DShield.org Suspicious Domain List (High)](https://www.dshield.org/feeds/suspiciousdomains_High.txt)
- [DShield.org Suspicious Domain List (Low)](https://www.dshield.org/feeds/suspiciousdomains_Low.txt)
- [DShield.org Suspicious Domain List (Medium)](https://www.dshield.org/feeds/suspiciousdomains_Medium.txt)
- [Firehol](https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level1.netset)
- [Global Advert Servers Blocklist - Personal Edition](https://hostsfile.mine.nu/hosts0.txt)
- [hpHosts - GRM only](https://hosts-file.net/grm.txt)
- [Hosts ADBlock](https://raw.githubusercontent.com/eladkarako/hosts.eladkarako.com/master/build/hosts_adblock.txt)
- [JustDomains](http://mirror1.malwaredomains.com/files/justdomains)
- [KADHosts](https://raw.githubusercontent.com/azet12/KADhosts/master/KADhosts.txt)
- [lightswitch05 (Daniel)'s hosts](https://raw.githubusercontent.com/lightswitch05/hosts/master/ads-and-tracking-extended.txt)
- [malc0de](http://malc0de.com/bl/)
- [Malware Domain List](https://www.malwaredomainlist.com/hostslist/hosts.txt)
- [Michael Trimm's Hosts](https://raw.githubusercontent.com/michaeltrimm/hosts-blocking/master/_hosts.txt)
- [MoaAB adblock.makala.is](http://adblock.mahakala.is/)
- [Phishing.Database](https://raw.githubusercontent.com/mitchellkrogza/Phishing.Database/master/phishing-domains-ACTIVE.txt)
- [pl-host file](https://raw.githubusercontent.com/xxcriticxx/.pl-host-file/master/hosts.txt)
- [Quidsup NoTrack Malware](https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-malware.txt)
- [Quidsup NoTrack](https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-blocklist.txt)
- [Reddestdream's Minimal Hosts](https://raw.githubusercontent.com/ReddestDream/reddestdream.github.io/master/Projects/MinimalHosts/etc/MinimalHostsBlocker/minimalhosts)
- [Ransomware Tracker Domain Blocklist](https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt)
- [ShallaList](http://www.shallalist.de/)
- [SMed79 - Various Lists](https://github.com/Ultimate-Hosts-Blacklist?utf8=%E2%9C%93&q=smed79&type=&language=)
- [somewhocares.org](http://someonewhocares.org/hosts/)
- [Spam404](https://raw.githubusercontent.com/Dawsey21/Lists/master/adblock-list.txt)
- [Suspicious.Snooping.Sniffing.Hacking.IP.Addresses](https://raw.githubusercontent.com/mitchellkrogza/Suspicious.Snooping.Sniffing.Hacking.IP.Addresses/master/ips.list)
- [The Big List of Hacked Malware Web Sites](https://raw.githubusercontent.com/mitchellkrogza/The-Big-List-of-Hacked-Malware-Web-Sites/master/hacked-domains.list)
- [Top Attacking Wordpress IP's](https://github.com/mitchellkrogza/Top-Attacking-IP-Addresses-Against-Wordpress-Sites)
- [uBlock Filters Plus](https://raw.githubusercontent.com/IDKwhattoputhere/uBlock-Filters-Plus/master/uBlock-Filters-Plus.txt)
- [WaLLy3K_Blacklist](https://v.firebog.net/hosts/static/w3kbl.txt)
- [YousList](https://github.com/yous/YousList)
- [YoYo.org](https://pgl.yoyo.org/as/serverlist.php?showintro=0;hostformat=hosts)
- [ZeroDot1 - CoinBlocker Lists](https://gitlab.com/ZeroDot1/CoinBlockerLists/raw/master/list.txt)
- [ZeroDot1 - CoinBlocker Lists (Browser)](https://gitlab.com/ZeroDot1/CoinBlockerLists/raw/master/list_browser.txt)
- [ZeroDot1 - CoinBlocker Lists (Optional)](https://gitlab.com/ZeroDot1/CoinBlockerLists/raw/master/list_optional.txt)
- [ZeusTracker](https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist)

---

## COLLABORATORS & CONTRIBUTORS

- [Maravento](https://github.com/maravento)
- [Nissar Chababy](https://github.com/funilrys)
- [SMed79](https://github.com/SMed79)
- [xxcriticxx](https://github.com/xxcriticxx)
- [ZeroDot1](https://github.com/ZeroDot1)
- [Mitchell Krog](https://github.com/mitchellkrogza)

---

## Some other awesome free projects

- <https://github.com/dead-hosts>
- <https://github.com/funilrys/funceble>
- <https://github.com/funilrys/PyFunceble>
- <https://github.com/mitchellkrogza/apache-ultimate-bad-bot-blocker>
- <https://github.com/mitchellkrogza/Badd-Boyz-Hosts>
- <https://github.com/mitchellkrogza/Fail2Ban-Blacklist-JAIL-for-Repeat-Offenders-with-Perma-Extended-Banning>
- <https://github.com/mitchellkrogza/fail2ban-useful-scripts>
- <https://github.com/mitchellkrogza/linux-server-administration-scripts>
- <https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker>
- <https://github.com/mitchellkrogza/Phishing.Database>
- <https://github.com/mitchellkrogza/Stop.Google.Analytics.Ghost.Spam.HOWTO>
- <https://github.com/mitchellkrogza/Travis-CI-for-Apache-For-Testing-Apache-and-PHP-Configurations>
- <https://github.com/mitchellkrogza/Travis-CI-Nginx-for-Testing-Nginx-Configuration>

---

## Help Support This Project

#### :sparkling_heart: Buy Mitchell a Coffee :point_down:
[<img src="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/kofi5.png" alt="Buy Mitchell some Coffee" width="200"/>](https://ko-fi.com/mitchellkrog)

#### :sparkling_heart: Buy Funilrys a Coffee :point_down:
[<img src="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/kofi5.png" alt="Buy Funilrys some Coffee" width="200"/>](https://ko-fi.com/funilrys)

---

### Into Photography?

Come drop by and visit me at <https://mitchellkrog.com>

---

# MIT License

## Copyright (c) 2017, 2018 Mitchell Krog - mitchellkrog@gmail.com

## <https://github.com/mitchellkrogza>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
