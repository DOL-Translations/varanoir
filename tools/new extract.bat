setlocal enabledelayedexpansion
cd /d "%~dp0"
for /L %%i in (0,1,1818) do (
    set "entry=%%i"
    "stcm2dump.exe" "../src/fs/union/07_EVENT/stcm2/0!entry!.STCM2" "../src/fs/union/07_EVENT/bytecode/0!entry!.bytecode" "../src/fs/union/07_EVENT/text/0!entry!.text"
)