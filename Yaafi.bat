@ECHO off

goto check_Permissions

:check_Permissions
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo off
    ) else (
        echo I know reading is hard but come on, it's the name of a file. Go RTFM.
		echo If this was a 3ds you'd have bricked.
pause
exit
    )
	
@ECHO off
CLS

:start
cd /d %~dp0
cls
echo Welcome to yet another ADB and Fastboot installer
echo Thanks to Erich Markus Pribitzer for the downloader
echo This'll install or update ADB and Fastboot to your windows directory so you can use it from any location.
echo 1. Install or update ADB/Fastboot
echo 2. Uninstall
echo 3. Exit
set /P A=Choose 1, 2, or 3 then press enter. 
if %A%==1 goto inup
if %A%==2 goto upda
if %A%==3 goto exit
goto start


:inup
:start_inup
cls
echo Making sure adb isn't running. 
adb kill-server
del C:\Windows\adb.exe C:\Windows\AdbWinApi.dll C:\Windows\AdbWinUsbApi.dll C:\Windows\fastboot.exe
cls
echo Working please wait.
mkdir Temp
curl -o Temp\ptw.zip -L https://dl.google.com/android/repository/platform-tools-latest-windows.zip
tar -xf Temp\ptw.zip -C Temp
robocopy Temp\platform-tools C:\Windows adb.exe AdbWinApi.dll AdbWinUsbApi.dll fastboot.exe /IS /NJH /NJS
cls
echo Cleaning temp files.
rmdir /S /Q Temp\
echo Done
pause
exit 

:unin
:start_unin
cls
echo Removing files.
del C:\Windows\adb.exe C:\Windows\AdbWinApi.dll C:\Windows\AdbWinUsbApi.dll C:\Windows\fastboot.exe
cls Done
pause
exit
