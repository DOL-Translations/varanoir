@echo off

set ISOFile=..\input\Gakuen Toshi Vara Noir Roses [J].iso
set ISOTargetSize=1459978240

if not exist "%ISOFile%" (
	echo [INFO] "%ISOFile%" was not found
	echo Did you name the ROM correctly and place it in the correct folder?
	echo Exiting in 10 seconds..
	C:\Windows\System32\timeout.exe /t 10 /nobreak >nul
	exit /b 0
)

for %%F in ("%ISOFile%") do (
    set "ISOSize=%%~zF"
)

if %ISOSize% neq %ISOTargetSize% (
    echo [INFO] "%ISOFile%" was has an incorrect size
    echo Are you using the uncompressed ROM?
    echo Exiting in 10 seconds..
    C:\Windows\System32\timeout.exe /t 10 /nobreak >nul
    exit /b 0
)

::setlocal enabledelayedexpansion
::for /L %%i in (0,1,1818) do (
::    set "entry=%%i"
::    "stcm2tools/stcm2insert.exe" "../src/fs/union/07_EVENT/text/0!entry!.text" "../src/fs/union/07_EVENT/bytecode/0!entry!.bytecode" "../src/fs/union/07_EVENT/stcm2/0!entry!.STCM2"
::)
::"bms/quickbms.exe" -w -r bms/event_uni_archive.bms ../src/fs/union/07_EVENT.uni ../src/fs/union/07_EVENT/stcm2/

echo [INFO] Compiling patches - Please wait..

bass\\win\\bass.exe ..\\src\\Main.asm

echo [INFO] Patches compiled
echo ---------- 
echo Finished!
echo ----------
C:\Windows\System32\timeout.exe /t 5 /nobreak >nul
exit /b 0