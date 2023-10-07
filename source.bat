@echo off
:MAIN
cls
echo EASYCHD 1.0 (Based on CHDMAN)
echo --------------------------------------
echo 1) CUE/GDI/ISO to CHD
echo 2) CHD to CUE
echo 3) CHD to GDI
echo 9) Exit
echo --------------------------------------
set /p mainaction=
if %mainaction%==1 goto CHD
if %mainaction%==2 goto CUE
if %mainaction%==3 goto MAIN
if %mainaction%==9 goto EXIT


:CHD
cls
echo YOUR INPUT/OUTPUT FOLDER PATH: (you can drag and drop, spaces will not work if you're in PowerShell)
set /p folderpath=
cls
xcopy %folderpath%
for /r %%i in (*.cue, *.gdi, *.iso) do chdman createcd -i "%%i" -o "%%~ni.chd"
xcopy *.chd %folderpath%
del *.iso
del *.chd
del *.cue
del *.cdi
del *.bin
cls
echo DONE CONVERTING
pause
goto MAIN

:CUE
cls
echo YOUR INPUT/OUTPUT FOLDER PATH: (you can drag and drop, spaces will not work if you're in PowerShell)
set /p folderpath=
cls
xcopy %folderpath%
for /r %%i in (*.chd) do chdman extractcd -i "%%i" -o "%%~ni.cue"
xcopy *.bin %folderpath%
xcopy *.cue %folderpath%
del *.chd
del *.cue
del *.cdi
del *.bin
cls
echo DONE CONVERTING
pause
goto MAIN

:GDI
cls
echo YOUR INPUT/OUTPUT FOLDER PATH: (you can drag and drop, spaces will not work if you're in PowerShell)
set /p folderpath=
cls
xcopy %folderpath%
for /r %%i in (*.chd) do chdman extractcd -i "%%i" -o "%%~ni.gdi"
xcopy *.bin %folderpath%
xcopy *.gdi %folderpath%
del *.chd
del *.cue
del *.cdi
del *.bin
cls
echo DONE CONVERTING
pause
goto MAIN

:EXIT
exit