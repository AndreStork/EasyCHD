@echo off
:MAIN
cls
echo EASYCHD (v. Alpha22.07.09)
echo --------------------------------------
echo 1) CUE or GDI to CHD
echo 2) CHD to CUE
echo 3) CHD to GDI (not working)
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
for /r %%i in (*.cue, *.gdi) do chdman createcd -i "%%i" -o "%%~ni.chd"
xcopy *.chd %folderpath%
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


:EXIT
exit