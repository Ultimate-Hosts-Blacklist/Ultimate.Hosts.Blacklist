:: ULTIMATE HOSTS BLACKLIST
:: REPO: https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist
:: Copyright Mitchell Krog - https://github.com/mitchellkrogza
:: This script will first create a backup of the original or current hosts
:: file and save it in a file titled "hosts.bak" 
:: It will then download the latest updated hosts file
:: Finally the DNS cache will also be refreshed.
:: THIS BAT FILE MUST BE LAUNCHED WITH ADMINISTRATOR PRIVILEGES
:: Copyright Mitchell Krog - https://github.com/mitchellkrogza

:: @ECHO OFF
TITLE Update Hosts

cd \
mkdir tmp

:: Check if we are administrator. If not, exit immediately.

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %ERRORLEVEL% NEQ 0 (
    ECHO This script must be run with administrator privileges!
    ECHO Please launch command prompt as administrator. Exiting...
    EXIT /B 1
)
if not exist "%WINDIR%\System32\drivers\etc\hosts.bak" (
	COPY %WINDIR%\System32\drivers\etc\hosts %WINDIR%\System32\drivers\etc\hosts.bak
    )
if not exist "%WINDIR%\System32\drivers\etc\hosts.original” (
	COPY %WINDIR%\System32\drivers\etc\hosts %WINDIR%\System32\drivers\etc\hosts.original
    )
:: Download Latest Updated Hosts File
:: Uses a Windows component called BITS 
:: It has been included in Windows since XP and 2000 SP3

bitsadmin.exe /transfer "Download Fresh Hosts File" https://hosts.ubuntu101.co.za/hosts.windows C:\tmp\hosts

echo Move new hosts file in-place

:: Move new hosts file in-place

COPY C:\tmp\hosts %WINDIR%\System32\drivers\etc\

echo Flush the DNS cache

:: Flush the DNS cache

ipconfig /flushdns

echo ALL DONE !!! Enjoy the Protection !!
