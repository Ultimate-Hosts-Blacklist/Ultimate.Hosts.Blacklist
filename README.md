# The Ultimate Hosts Blacklist

<img src="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/ultimate-hosts-blacklist-logo.png" alt="The Ultimate Hosts File blacklist to Protect your Children, Your Family and Yourself from accessing Bad Web Sites"/><img src="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/spacer.jpg"/>[![Build Status](https://travis-ci.org/mitchellkrogza/Ultimate.Hosts.Blacklist.svg?branch=master)](https://travis-ci.org/mitchellkrogza/Ultimate.Hosts.Blacklist)<img src="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/spacer.jpg"/>[![DUB](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/LICENSE.md)<img src="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/.assets/spacer.jpg"/><a href='https://twitter.com/ubuntu101za'><img src='https://img.shields.io/twitter/follow/ubuntu101za.svg?style=social&label=Follow' alt='Follow @ubuntu101za'></a>

The Ultimate hosts file for protecting your computer or device against over a million bad web sites. Protect your children and family from gaining access to bad web sites and protect your devices and pc from being infected with Malware or Ransomware.

A hosts file for use on any operating system to block bad domains out of your servers or devices.

_______________
- Version: **V1.2017.08.261**
- Total Bad Hosts in hosts file: **1,031,447**
- Total Bad Hosts in hosts.deny file: **360,378**
- Total Bad Hosts and IP's in superhosts.deny file: **1,391,816**

 :exclamation: **Yes you did indeed read those numbers correctly** :exclamation: 
```
# File generated with https://github.com/funilrys/funceble
# Date of generation: Tue Aug 29 19:28:40 SAST 2017


Status      Percentage   Numbers     
----------- ------------ -------------
ACTIVE      76%          164140      
INACTIVE    23%          49915       
INVALID     0%           26          
```
____________________

Information gathered from multiple sources and merged into one massive hosts file

- RAW FILE SOURCES

<a href="https://hosts.ubuntu101.co.za/hosts">hosts for Unix systems (RAW)</a><br/>
<a href="https://hosts.ubuntu101.co.za/hosts.windows">hosts for Windows systems (CRLF) (RAW)</a> | **<a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/update-hosts-windows.bat">Try the Windows Installer / Updater</a><br/>**
<a href="https://hosts.ubuntu101.co.za/hosts.deny">hosts.deny (RAW)</a><br/>
<a href="https://hosts.ubuntu101.co.za/superhosts.deny">superhosts.deny (RAW)</a><br/>
<a href="https://hosts.ubuntu101.co.za/domains.list">domains-list (RAW)</a><br/>
<a href="https://hosts.ubuntu101.co.za/ips.list">ip-list (RAW)</a>

************************************************
## WHAT IS A HOSTS FILE?

A hosts file, named `hosts` (with no file extension), is a plain-text file
used by all operating systems to map hostnames to IP addresses.

In most operating systems, the `hosts` file is preferential to `DNS`.
Therefore if a domain name is resolved by the `hosts` file, the request never
leaves your computer.

Having a smart `hosts` file goes a long way towards blocking malware, adware, ransomware, porn and other nuisance web sites.

A hosts file like this causes any lookups to any of the listed domains to resolve back to your localhost so it prevents any outgoing connections to the listed domains.

************************************************
## WHAT IS A HOSTS.DENY FILE?

A hosts file, named `hosts.deny` is a plain-text file for Linux/Unix based operating systems only which blocks a list of IP addresses on the outside of your network from gaining any access to your computer. A `hosts.deny` file will not work on a Windows operating system.

************************************************
## WHAT IS A SUPERHOSTS.DENY FILE? **I've never heard of that ??**

The superhosts.deny file is simply named `superhosts.deny` but is actually just a normal `hosts.deny` file which is a plain-text file for Linux/Unix based operating systems which blocks a list of IP addresses or hosts (domains) on the outside of your network from gaining any access to your computer. If you want to user this `superhosts.deny` file simply rename it to `hosts.deny` and place it in your `/etc/` folder on your Linux/Unix operating system. A `hosts.deny` file will not work on a Windows operating system.

************************************************
## WHERE DO I PUT THIS ON MY COMPUTER?

To modify your current `hosts` file, look for it in the following places and modify it with a text
editor. 

**PLEASE NOTE:** On all operating systems you need administrative access to modify the hosts file. You can Google on how to do this for your particular operating system.

**Linux, Mac OS X, iOS, Android**: `/etc/hosts`

**Linux, Mac OS X, iOS, Android**: `/etc/hosts.deny`

**Windows Systems**: `%SystemRoot%\system32\drivers\etc\hosts`

************************************************
## WHERE CAN I DOWNLOAD THE RAW UNZIPPED FILES FROM?

To keep this Github repo small, all files are provided in a zip only format. Some people however require their Pi-Holes or other systems to automatically download a raw file once a week or so as an update. For your convenience you can download these raw files at the following links. These links below will always contain tha latest updated version of these files.

<a href="https://hosts.ubuntu101.co.za/hosts">hosts for Unix systems (RAW)</a><br/>
<a href="https://hosts.ubuntu101.co.za/hosts.windows">hosts for Windows systems (CRLF) (RAW)</a> | **<a href="https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/blob/master/update-hosts-windows.bat">Try the Windows Installer / Updater</a><br/>**
<a href="https://hosts.ubuntu101.co.za/hosts.deny">hosts.deny (RAW)</a><br/>
<a href="https://hosts.ubuntu101.co.za/superhosts.deny">superhosts.deny (RAW)</a><br/>
<a href="https://hosts.ubuntu101.co.za/domains.list">domains-list (RAW)</a><br/>
<a href="https://hosts.ubuntu101.co.za/ips.list">ip-list (RAW)</a>

************************************************
## ADDITIONS / REMOVALS / CORRECTIONS !!

[![Log an Issue](https://img.shields.io/badge/LOG%20-%20an%20issue%20%F0%9F%9A%A6-blue.svg)](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist/issues) if you disagree with anything on this list or want to add any other bad web sites to the list.

You can also fork a copy of this repo, create a new unique folder in .input_sources, call your file domains.txt and simply send a Pull Request to the repository and it will be added.

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
