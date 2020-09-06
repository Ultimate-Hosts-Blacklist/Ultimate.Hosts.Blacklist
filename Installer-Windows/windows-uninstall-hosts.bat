:: ULTIMATE HOSTS BLACKLIST
:: REPO: https://github.com/Ultimate-Hosts-Blacklist/Ultimate.Hosts.Blacklist
:: Copyright Mitchell Krog - https://github.com/mitchellkrogza
:: This script will first create a backup of the original or current hosts
:: file and save it in a file titled "hosts.bak" 
:: It will then download the latest updated hosts file
:: Finally the DNS cache will also be refreshed.
:: THIS BAT FILE MUST BE LAUNCHED WITH ADMINISTRATOR PRIVILEGES
:: Copyright Mitchell Krog - https://github.com/mitchellkrogza

:: @ECHO OFF
TITLE Uninstall Hosts

:: Check if we are administrator. If not, exit immediately.

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %ERRORLEVEL% NEQ 0 (
    ECHO This script must be run with administrator privileges!
    ECHO Please launch command prompt as administrator. Exiting...
    EXIT /B 1
)
	COPY %WINDIR%\System32\drivers\etc\hosts.original %WINDIR%\System32\drivers\etc\hosts
)

:: Flush the DNS cache

ipconfig /flushdns

echo ALL DONE !!! Original hosts file restored !!
