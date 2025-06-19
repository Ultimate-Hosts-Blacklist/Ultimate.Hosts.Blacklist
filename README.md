# The Ultimate Hosts Blacklist - Largest Unified Hosts File in the Universe

![Ultimate Hosts Blacklist](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/raw/master/.assets/ultimate-hosts-blacklist-logo.png)

The Ultimate Hosts Blacklist (UHB) is undoubtedly one of the world's largest
curated and unified hosts file to protect your network, computer, device,
children, or family against over several hundred thousand malicious actors.

All our information is gathered from multiple sources, tested regularly and
merged into one massive file which is updated daily.
Our hosts can be used on almost all operating system but we also propose 2 DNS
servers that ingest and block the bad actor as good - if not better - than a
hosts file.

---

| **Updated**   | Daily :heavy_check_mark:                                                                                                                                                                                      |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Fueled By** | [![Hosts File - Ultimate Hosts Blacklist](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/raw/master/.assets/ultimate-hosts-org-small.png)](https://github.com/Ultimate-Hosts-Blacklist) |

---

- Version: **V2.2873.2025.06.19**
- Total Bad domains in `hosts` file: **538,996**
- Total Bad IP in `hosts.deny` file: **143,089**
- Total Bad domains and IP in `superhosts.deny` file: **682,085**

  :exclamation: **Yes you did indeed read those numbers correctly** :exclamation:

---

## WHERE TO REPORT OR DISCUSS ABOUT SOMETHING ?

Because we work from so many places within our
[GitHub organization](https://github.com/Ultimate-Hosts-Blacklist), please use
this table to learn about where to discuss or report something.

| Action     | Type           | Link Platform | Link                                                                                             |
| ---------- | -------------- | ------------- | ------------------------------------------------------------------------------------------------ |
| Question   | general        | GitHub        | [:link:](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/discussions/new)   |
| Discussion | general        | GitHub        | [:link:](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/discussions/new)   |
| Issue      | general        | GitHub        | [:link:](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/issues/new/choose) |
| Question   | infrastructure | GitHub        | [:link:](https://github.com/Ultimate-Hosts-Blacklist/dev-center/discussions/new)                 |
| Discussion | infrastructure | GitHub        | [:link:](https://github.com/Ultimate-Hosts-Blacklist/dev-center/discussions/new)                 |
| Issue      | infrastructure | GitHub        | [:link:](https://github.com/Ultimate-Hosts-Blacklist/dev-center/issues/new)                      |
| Add        | list           | GitHub        | [:link:](https://github.com/Ultimate-Hosts-Blacklist/dev-center/issues/new/choose)               |
| Remove     | list           | GitHub        | [:link:](https://github.com/Ultimate-Hosts-Blacklist/dev-center/issues/new/choose)               |
| Add        | domain         | GitHub        | [:link:](https://github.com/Ultimate-Hosts-Blacklist/blacklist/issues/new/choose)                |
| Remove     | domain         | GitHub        | [:link:](https://github.com/Ultimate-Hosts-Blacklist/whitelist/issues/new/choose)                |
| Add        | IP             | GitHub        | [:link:](https://github.com/Ultimate-Hosts-Blacklist/blacklist/issues/new/choose)                |
| Remove     | IP             | GitHub        | [:link:](https://github.com/Ultimate-Hosts-Blacklist/whitelist/issues/new/choose)                |

For everything that is not listed above, please submit an issue [here](https://github.com/Ultimate-Hosts-Blacklist/issues/new/choose).

---

## WHEN IS THE LIST UPDATED ?

| Times are in UTC (Every day)                                                                         | Start   | End     |
| ---------------------------------------------------------------------------------------------------- | ------- | ------- |
| Central Repository (GitHub)                                                                          | ≈ 19:05 | ≈ 19:15 |
| API / Search engine                                                                                  | 19:05   | ≈ 19:20 |
| Official Mirror (hosts.ubuntu101.co.za)                                                              | 19:30   | ≈ 19:35 |
| DNS Server ([#590](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/issues/590)) | 19:30   | ≈ 19:40 |

---

## DNS SERVER

If all our files are too large for your device to ingest or if you don't want
to think about updating the `hosts` file every night, you can use
our DNS servers.

They are **not logging anything** and are available round the clock.

From time to time we may need to process some maintenance that requires a
downtime of less than 120 seconds.

We will **never put downtime on both servers at the same time**.
But, if you want to get informed about when downtime is scheduled, please
follow/subscribe to the
[Maintenance Thread](https://github.com/Ultimate-Hosts-Blacklist/dev-center/issues/51).

**NOTICE: THIS IS THE RECOMMENDED METHOD FOR WINDOWS USER.**

| DNS Name | safedns.allover.co.za   | safedns2.allover.co.za  | Ports        |
| -------- | ----------------------- | ----------------------- | ------------ |
| IPv4     | `88.198.70.38`          | `88.198.70.39`          | `53`, `5353` |
| IPv6     | `2a01:4f8:140:5021::38` | `2a01:4f8:140:5021::39` | `53`, `5353` |

---

## RAW FILE SOURCES

The links below will direct you to the raw unzipped versions of the hosts files in this repo. (Files are updated daily)

| File Name                  | Operating System | Format   | Official Mirror                                                      |
| -------------------------- | ---------------- | -------- | -------------------------------------------------------------------- |
| hosts                      | Unix/Linux       | UNIX     | [Download](https://hosts.ubuntu101.co.za/hosts)                      |
| hosts                      | Windows          | CRLF/DOS | [Download](https://hosts.ubuntu101.co.za/hosts.windows)              |
| hosts.deny                 | Unix/Linux       | UNIX     | [Download](https://hosts.ubuntu101.co.za/hosts.deny)                 |
| superhosts.deny            | Unix/Linux       | UNIX     | [Download](https://hosts.ubuntu101.co.za/superhosts.deny)            |
| domains.list               | Any / Pi-Hole    | UNIX     | [Download](https://hosts.ubuntu101.co.za/domains.list)               |
| domains-dotted-format.list | DnsMasq          | UNIX     | [Download](https://hosts.ubuntu101.co.za/domains-dotted-format.list) |
| ips.list                   | Any / Pi-Hole    | UNIX     | [Download](https://hosts.ubuntu101.co.za/ips.list)                   |

---

## INSTALLERS, UPDATERS AND UNINSTALLER SCRIPTS

**:warning::warning: WE DO NOT RECOMMEND THE USAGE OF THE HOSTS FILE INSIDE A WINDOWS MACHINE! :warning::warning:**

**:warning::warning: WINDOWS USER ARE RECOMMENDED TO USE THE [DNS SERVER](#dns-server) INSTEAD :warning::warning:**

| Linux                                                                                                                                                                | Windows                                                                                                                                             |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| [hosts Installer](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-installer.sh)                         | [hosts Installer](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-install-hosts.bat)     |
| [hosts UnInstaller](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-uninstaller.sh)                     | [hosts Updater](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-update-hosts.bat)        |
| [hosts Updater](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts-updater.sh)                             | [hosts UnInstaller](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-uninstall-hosts.bat) |
| [hosts.deny Installer](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-installer.sh)               |
| [hosts.deny UnInstaller](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-uninstaller.sh)           |
| [hosts.deny Updater](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-hosts.deny-updater.sh)                   |
| [superhosts.deny Installer](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-installer.sh)     |
| [superhosts.deny UnInstaller](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-uninstaller.sh) |
| [superhosts.deny Updater](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Linux/linux-superhosts.deny-updater.sh)         |

---

## WHAT IS A HOSTS FILE?

A hosts file, named `hosts` (with no file extension), is a plain-text file used
by all operating systems to map a hostname to IP addresses.

In most operating systems, the `hosts` file is preferential to `DNS`.
Therefore if a domain name is resolved by the `hosts` file,
the request never leaves your computer.

Having a smart `hosts` file goes a long way towards blocking malware, adware,
ransomware, porn and other nuisance domains.

A `hosts` file like this causes any lookups to any of the listed domains to
resolve back to your localhost so it prevents any outgoing connections to the
listed domains.

For example, to drop all requests to certain domains or servers, adding lines
to your `hosts` file as below will achieve this for you.
You can create your custom hosts or simply use ours which covers you for
well over 538,996 bad domains.

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

It is important to note that a `hosts` file cannot understand wild card domains.
So adding `0.0.0.0 *.doubleclick.net` will not work. You must specify every
variation of a domain name that is in use and up to no good.

Lucky for you our massive `hosts` file compiled from over
several input sources already does this for you. So it is as simple as
downloading our `hosts` file and keeping it up to date as we update the hosts
file several times a week as new threats emerge.

---

## RECOMMENDATION FOR USING `0.0.0.0` INSTEAD OF `127.0.0.1`

Most host files traditionally use `127.0.0.1` as the loopback address,
to establish an IP connection to the local machine.

I prefer the use of `0.0.0.0`, which is defined as a non-routable meta-address.
Using `0.0.0.0` is also faster because there's no wait for a timeout resolution.
It also does not interfere with any web servers that may be running on the
local system.

For many Windows versions however, `127.0.0.1` does appear to work slightly
better and which is why our Windows version of the `hosts` file uses
`127.0.0.1` as the loopback address.

---

## WHAT IS A HOSTS.DENY FILE?

A `hosts` file, named `hosts.deny` is a plain-text file for Linux/Unix based
operating systems only which blocks a list of IP addresses on the outside of
your network from gaining any access to your computer.
A `hosts.deny` file will not work on a Windows operating system.

---

## WHAT IS A SUPERHOSTS.DENY FILE? **I've never heard of such a thing ??**

The `superhosts.deny` file is simply named `superhosts.deny` but is just a
normal `hosts.deny` file which is a plain-text file for Linux/Unix based
operating systems that blocks a list of IP addresses or hosts (domains) on the
outside of your network from gaining any access to your computer.
If you want to use this `superhosts.deny` file simply rename it to
`hosts.deny` and place it in your `/etc/` folder on your Linux/Unix
operating system.
A `hosts.deny` file will not work on a Windows operating system.

---

## WHERE DO I PUT THIS ON MY COMPUTER?

To modify your current `hosts` file, look for it in the following places
and modify it with a text editor.

**PLEASE NOTE:** On all operating systems you need administrative access to
modify the `hosts` file.

**Linux, Mac OS X, iOS, Android**: `/etc/hosts`

**Linux, Mac OS X, iOS, Android**: `/etc/hosts.deny`

**Windows Systems _(NOT RECOMMENDED: PREFER DNS SERVER)_**: `%SystemRoot%\system32\drivers\etc\hosts` **[Try the Windows Installer Batch Script](https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/blob/master/Installer-Windows/windows-install-hosts.bat)**

---

## CREDITS & THANKS

Our `hosts` file is generated from multiple input sources, collated, sorted for
duplicates and merged into one single hosts file.

The sources of the input data information are as follows.

| Downstream Name | Downstream Link | Upstream Link |
| --------------- | --------------- | ------------- |
| 2o7.net | [Link](https://github.com/Ultimate-Hosts-Blacklist/2o7.net) | [Link](https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts) |
| adblock-nocoin-list | [Link](https://github.com/Ultimate-Hosts-Blacklist/adblock-nocoin-list) | [Link](https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/hosts.txt) |
| Add_Risk | [Link](https://github.com/Ultimate-Hosts-Blacklist/Add_Risk) | [Link](https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts) |
| Add_Spam | [Link](https://github.com/Ultimate-Hosts-Blacklist/Add_Spam) | [Link](https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Spam/hosts) |
| Ads_Disconnect.me | [Link](https://github.com/Ultimate-Hosts-Blacklist/Ads_Disconnect.me) | [Link](https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt) |
| antipopads | [Link](https://github.com/Ultimate-Hosts-Blacklist/antipopads) | [Link](https://raw.githubusercontent.com/Yhonay/antipopads/master/hosts) |
| anudeepND_blacklist_ad_server | [Link](https://github.com/Ultimate-Hosts-Blacklist/anudeepND_blacklist_ad_server) | [Link](https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt) |
| Bad_JAV_Sites | [Link](https://github.com/Ultimate-Hosts-Blacklist/Bad_JAV_Sites) | [Link]() |
| BaddBoyzHosts | [Link](https://github.com/Ultimate-Hosts-Blacklist/BaddBoyzHosts) | [Link](https://raw.githubusercontent.com/mitchellkrogza/Badd-Boyz-Hosts/master/domains) |
| BadIPs.com_KEY | [Link](https://github.com/Ultimate-Hosts-Blacklist/BadIPs.com_KEY) | [Link](https://hosts.ubuntu101.co.za/badips.txt) |
| BadIPs.com_Level_3 | [Link](https://github.com/Ultimate-Hosts-Blacklist/BadIPs.com_Level_3) | [Link](http://www.badips.com/get/list/any/3?age=12) |
| BadIPs.com_Level_4 | [Link](https://github.com/Ultimate-Hosts-Blacklist/BadIPs.com_Level_4) | [Link](http://www.badips.com/get/list/any/4?age=12) |
| BadIPs.com_Level_5 | [Link](https://github.com/Ultimate-Hosts-Blacklist/BadIPs.com_Level_5) | [Link](http://www.badips.com/get/list/any/5?age=12) |
| blacklist | [Link](https://github.com/Ultimate-Hosts-Blacklist/blacklist) | [Link]() |
| cameleon_at_sysctl.org | [Link](https://github.com/Ultimate-Hosts-Blacklist/cameleon_at_sysctl.org) | [Link](http://sysctl.org/cameleon/hosts) |
| Cyveillance_Blocks | [Link](https://github.com/Ultimate-Hosts-Blacklist/Cyveillance_Blocks) | [Link]() |
| firehol_level1 | [Link](https://github.com/Ultimate-Hosts-Blacklist/firehol_level1) | [Link](https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level1.netset) |
| hostsVN | [Link](https://github.com/Ultimate-Hosts-Blacklist/hostsVN) | [Link](https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts) |
| justdomains_mirror1.malwaredomains.com | [Link](https://github.com/Ultimate-Hosts-Blacklist/justdomains_mirror1.malwaredomains.com) | [Link](https://raw.githubusercontent.com/smed79/mdlm/master/justdomains.txt) |
| KADhosts_azet12 | [Link](https://github.com/Ultimate-Hosts-Blacklist/KADhosts_azet12) | [Link](https://raw.githubusercontent.com/azet12/KADhosts/master/KADhosts.txt) |
| lightswitch05_hosts_ads-and-tracking-extended | [Link](https://github.com/Ultimate-Hosts-Blacklist/lightswitch05_hosts_ads-and-tracking-extended) | [Link](https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt) |
| malc0de.com | [Link](https://github.com/Ultimate-Hosts-Blacklist/malc0de.com) | [Link](http://malc0de.com/bl/IP_Blacklist.txt) |
| MalwareDomainList.com | [Link](https://github.com/Ultimate-Hosts-Blacklist/MalwareDomainList.com) | [Link](https://raw.githubusercontent.com/smed79/mdlm/master/hosts.txt) |
| Michael_Trimms_Hosts | [Link](https://github.com/Ultimate-Hosts-Blacklist/Michael_Trimms_Hosts) | [Link](https://raw.githubusercontent.com/michaeltrimm/hosts-blocking/master/_hosts.txt) |
| MinimalHostsBlocker | [Link](https://github.com/Ultimate-Hosts-Blacklist/MinimalHostsBlocker) | [Link](https://reddestdream.github.io/Projects/MinimalHosts/etc/MinimalHostsBlocker/minimalhosts) |
| Mitchell_Krog_Snooping_IPS | [Link](https://github.com/Ultimate-Hosts-Blacklist/Mitchell_Krog_Snooping_IPS) | [Link]() |
| Phishing.Database | [Link](https://github.com/Ultimate-Hosts-Blacklist/Phishing.Database) | [Link](https://raw.githubusercontent.com/mitchellkrogza/Phishing.Database/master/phishing-domains-ACTIVE.txt) |
| pl-host-file | [Link](https://github.com/Ultimate-Hosts-Blacklist/pl-host-file) | [Link](https://raw.githubusercontent.com/xxcriticxx/.pl-host-file/master/hosts.txt) |
| quidsup_malicious-sites | [Link](https://github.com/Ultimate-Hosts-Blacklist/quidsup_malicious-sites) | [Link](https://gitlab.com/quidsup/notrack-blocklists/-/raw/master/malware.list) |
| quidsup_notrack_trackers | [Link](https://github.com/Ultimate-Hosts-Blacklist/quidsup_notrack_trackers) | [Link](https://gitlab.com/quidsup/notrack-blocklists/-/raw/master/trackers.list) |
| smed79_blacklist | [Link](https://github.com/Ultimate-Hosts-Blacklist/smed79_blacklist) | [Link](https://raw.githubusercontent.com/smed79/blacklist/master/hosts.txt) |
| someonewhocares.org | [Link](https://github.com/Ultimate-Hosts-Blacklist/someonewhocares.org) | [Link](https://someonewhocares.org/hosts/zero/hosts) |
| Spam404 | [Link](https://github.com/Ultimate-Hosts-Blacklist/Spam404) | [Link](https://raw.githubusercontent.com/Spam404/lists/master/main-blacklist.txt) |
| SSH_attackers_probers | [Link](https://github.com/Ultimate-Hosts-Blacklist/SSH_attackers_probers) | [Link]() |
| Suspicious.Snooping.Sniffing.Hacking.IP.Addresses | [Link](https://github.com/Ultimate-Hosts-Blacklist/Suspicious.Snooping.Sniffing.Hacking.IP.Addresses) | [Link](https://raw.githubusercontent.com/mitchellkrogza/Suspicious.Snooping.Sniffing.Hacking.IP.Addresses/master/ips.list) |
| The-Big-List-of-Hacked-Malware-Web-Sites | [Link](https://github.com/Ultimate-Hosts-Blacklist/The-Big-List-of-Hacked-Malware-Web-Sites) | [Link](https://raw.githubusercontent.com/mitchellkrogza/The-Big-List-of-Hacked-Malware-Web-Sites/master/hacked-domains.list) |
| Top-Attacking-IP-Addresses-Against-Wordpress-Sites | [Link](https://github.com/Ultimate-Hosts-Blacklist/Top-Attacking-IP-Addresses-Against-Wordpress-Sites) | [Link](https://raw.githubusercontent.com/mitchellkrogza/Top-Attacking-IP-Addresses-Against-Wordpress-Sites/master/wordpress-attacking-ips.txt) |
| WaLLy3K_Blacklist | [Link](https://github.com/Ultimate-Hosts-Blacklist/WaLLy3K_Blacklist) | [Link](https://v.firebog.net/hosts/static/w3kbl.txt) |
| Wiggum27_Blockers | [Link](https://github.com/Ultimate-Hosts-Blacklist/Wiggum27_Blockers) | [Link](https://gitlab.com/Wiggum27/blockers/-/raw/master/hosts) |
| www.blocklist.de | [Link](https://github.com/Ultimate-Hosts-Blacklist/www.blocklist.de) | [Link](https://lists.blocklist.de/lists/all.txt) |
| YousList | [Link](https://github.com/Ultimate-Hosts-Blacklist/YousList) | [Link](https://raw.githubusercontent.com/yous/YousList/master/hosts.txt) |
| yoyo.org_domains | [Link](https://github.com/Ultimate-Hosts-Blacklist/yoyo.org_domains) | [Link](https://pgl.yoyo.org/as/serverlist.php?hostformat=hosts;showintro=0) |
| yoyo.org_ips | [Link](https://github.com/Ultimate-Hosts-Blacklist/yoyo.org_ips) | [Link](https://pgl.yoyo.org/adservers/iplist.php?format=&showintro=0) |
| ZeroDot1_CoinBlockerLists | [Link](https://github.com/Ultimate-Hosts-Blacklist/ZeroDot1_CoinBlockerLists) | [Link](https://zerodot1.gitlab.io/CoinBlockerLists/list.txt) |
| ZeroDot1_CoinBlockerLists_browser | [Link](https://github.com/Ultimate-Hosts-Blacklist/ZeroDot1_CoinBlockerLists_browser) | [Link](https://gitlab.com/ZeroDot1/CoinBlockerLists/-/raw/master/list_browser.txt) |

---

## AWESOME TOOLS WE WROTE

- [UHBW - Ultimate Hosts Blacklist Whitelist](https://pypi.org/project/ultimate-hosts-blacklist-whitelist/)
  - A - global - whitelisting tool (not limited to our infrastructure).
- [UHBIRU - Ultimate Hosts Blacklist Test Launcher](https://pypi.org/project/ultimate-hosts-blacklist-test-launcher/)
  - The tool to update/test our input source repositories.
- [UHBCRU - Ultimate Hosts Blacklist Central Repo Updater](https://pypi.org/project/ultimate-hosts-blacklist-central-repo-updater/)
  - The tool to update this repository.

---

## AWESOME TOOLS WE USE

- [PyFunceble](https://github.com/funilrys/PyFunceble)
  - The tool to check the availability or syntax of domain, IP or URL.

---

## SOME OTHER AWESOME TOOLS/PROJECTS

- [Dead-Hosts](https://github.com/dead-hosts)
- [NGINX Ultimate Bad Blocker](https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker)
- [Apache Ultimate Bad Bot Blocker](https://github.com/mitchellkrogza/apache-ultimate-bad-bot-blocker)
- [Fail2Ban Blacklist JAIL for Repeat Offenders](https://github.com/mitchellkrogza/Fail2Ban-Blacklist-JAIL-for-Repeat-Offenders-with-Perma-Extended-Banning)
- [Phishing Database](https://github.com/mitchellkrogza/Phishing.Database)
- [Stop Google Analytics Ghost Spam HOWTO](https://github.com/mitchellkrogza/Stop.Google.Analytics.Ghost.Spam.HOWTO)

---

## SUPPORT THIS PROJECT AND ITS INFRASTRUCTURE

#### :sparkling_heart: Buy Mitchell a Coffee :point_down:

[![Buy Mitchell some Coffee](https://raw.githubusercontent.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/master/.assets/kofi5.png)](https://ko-fi.com/mitchellkrog)

#### :sparkling_heart: Support Nissar :point_down:

[![Buy Nissar some Coffee](https://raw.githubusercontent.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist/master/.assets/kofi5.png)](https://ko-fi.com/funilrys)

[:heart: Sponsor Nissar on GitHub](https://github.com/sponsors/funilrys)

---

### Into Photography?

Come drop by and visit [Mitchell's Portfolio](https://mitchellkrog.com).

---

# License

```
MIT License

Copyright (c) 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024 Ultimate Hosts Blacklist - @Ultimate-Hosts-Blacklist Contributors
Copyright (c) 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024 Mitchell Krog - @mitchellkrogza
Copyright (c) 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024 Nissar Chababy - @funilrys

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
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
---
[⇈ Back to Top](#the-ultimate-hosts-blacklist---largest-unified-hosts-file-in-the-universe)

