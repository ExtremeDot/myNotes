@echo off

:menu
cls
echo Please select an option:
echo 1. Generate SHA256 hash for Local Files
echo 2. Generate SHA256 hash for ovpn.conf
echo 3. Generate SHA256 hash for riglist.json
echo 4. Generate SHA256 hash for network package
echo 0. Exit

set /p choice=Enter your choice:

if "%choice%"=="1" goto sha256lcoal
if "%choice%"=="2" goto sha256ovpn
if "%choice%"=="3" goto sha256riglist
if "%choice%"=="4" goto sha256networkpack
if "%choice%"=="0" goto end

echo Invalid choice. Please try again.
pause
goto menu

:sha256networkpack
set "latest_online_netpack=https://raw.githubusercontent.com/ExtremeDot/myNotes/main/activelist/network-config.deb"

echo Downloading files...
curl -o network-config.deb %latest_online_netpack%

echo Generating SHA256 hash codes...
certutil -hashfile "network-config.deb" SHA256 | findstr /r "[0-9A-Fa-f]*$" > netpack_hash.txt

echo Hash codes generated successfully.

if not exist "netpack_hash.txt" (
  echo Error: netpack_hash.txt not found.
  pause
  goto end
)
setlocal enabledelayedexpansion

set count=0
color 0A
for /f "tokens=*" %%a in (netpack_hash.txt) do (
  set /a count+=1
  if !count! == 2 (
    echo == Network Package HASH ========================================
    echo %%a
	echo ================================================================
	set "secondline=%%a"
    goto endloop
  )
)

:sha256ovpn
set "latest_online_ovpn=https://raw.githubusercontent.com/ExtremeDot/myNotes/main/activelist/ovpn.conf"

echo Downloading files...
curl -o ovpn.conf %latest_online_ovpn%

echo Generating SHA256 hash codes...
certutil -hashfile "ovpn.conf" SHA256 | findstr /r "[0-9A-Fa-f]*$" > ovpn_hash.txt

echo Hash codes generated successfully.

if not exist "ovpn_hash.txt" (
  echo Error: ovpn_hash.txt not found.
  pause
  goto end
)
setlocal enabledelayedexpansion

set count=0
color 0A
for /f "tokens=*" %%a in (ovpn_hash.txt) do (
  set /a count+=1
  if !count! == 2 (
    echo == Open VPN HASH ===============================================
    echo %%a
	echo ================================================================
	set "secondline=%%a"
    goto endloop
  )
)

:sha256riglist
set "ult_active_list=https://raw.githubusercontent.com/ExtremeDot/myNotes/main/activelist/riglist.json"

echo Downloading files...
curl -o riglist.json %ult_active_list%

echo Generating SHA256 hash codes...
certutil -hashfile "riglist.json" SHA256 | findstr /r "[0-9A-Fa-f]*$" > riglist_hash.txt

echo Hash codes generated successfully.

if not exist "riglist_hash.txt" (
  echo Error: riglist_hash.txt not found.
  pause
  goto end
)
setlocal enabledelayedexpansion

set count=0
color 0A
for /f "tokens=*" %%a in (riglist_hash.txt) do (
  set /a count+=1
  if !count! == 2 (
    echo == RigList HASH ================================================
    echo %%a
	echo ================================================================
	set "secondline=%%a"
    goto endloop
  )
)

pause
goto menu

:sha256lcoal
echo Drag and drop the file you want to hash onto this window and press ENTER:
set /p file=

certutil -hashfile "%file%" SHA256 | findstr /r "[0-9A-Fa-f]*$" > hash.txt
set /p hash=<hash.txt


if not exist "hash.txt" (
  echo Error: hash.txt not found.
  pause
  goto end
)

setlocal enabledelayedexpansion

set count=0
color 0A
for /f "tokens=*" %%a in (hash.txt) do (
  set /a count+=1
  if !count! == 2 (
    echo ================================================================
    echo %%a
	echo ================================================================
	set "secondline=%%a"
    goto endloop
  )
)

:endloop
color 07
if not defined secondline (
  echo Error: SHA256 hash not found in hash.txt.
) else (
  echo Copying SHA256 hash to clipboard...
  echo !secondline! | clip
)

pause
goto menu

:end
