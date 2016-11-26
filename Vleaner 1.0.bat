@ECHO OFF
@echo This batch is published by Vigor
@echo Clean up junk files
DEL /F /S /Q "C:\WINDOWS\PCHealth\ERRORREP\QSIGNOFF\*.*"
DEL /F /S /Q "C:\WINDOWS\PCHealth\ERRORREP\UserDumps\*.*"
DEL /F /S /Q "C:\WINDOWS\system32\LogFiles\HTTPERR\*.*"
DEL /F /S /Q "C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\*.*"
DEL /F /S /Q "C:\WINDOWS\Microsoft.NET\Framework\v1.1.4322\Temporary ASP.NET Files\*.*"
DEL /F /S /Q "C:\windows\temp\*.*"
DEL /F /S /Q /A:S "C:\WINDOWS\IIS Temporary Compressed Files\*.*"

@echo Remove the patch backup directory 
RD %windir%\$hf_mig$ /Q /S 

@echo The name of the patch uninstall folder is saved as 2950800.txt 
dir %windir%\$NtUninstall* /a:d /b >%windir%\2950800.txt 

@echo Reads the folder list from 2950800.txt and deletes the folder
for /f %%i in (%windir%\2950800.txt) do rd %windir%\%%i /s /q 

@echo Remove 2950800.txt 
del %windir%\2950800.txt /f /q 

@echo Delete patch installation records (the following del / f / s / q% systemdrive% \ *. Log already contains the deletion of such documents) 
del %windir%\KB*.log /f /q 

@echo Delete the system disk directory temporary files 
del /f /s /q %systemdrive%\*.tmp 

@echo Delete the system disk directory temporary files 
del /f /s /q %systemdrive%\*._mp 

@echo Delete the system disk directory log files 
del /f /s /q %systemdrive%\*.log 

@echo Delete the system disk directory GID file (a temporary file, the specific role is unknown) 
del /f /s /q %systemdrive%\*.gid 

@echo Delete the system directory scandisk (disk scan) left useless files 
del /f /s /q %systemdrive%\*.chk 

@echo Delete system catalog old documents
del /f /s /q %systemdrive%\*.old 

@echo Remove unwanted files from the Recycle Bin 
del /f /s /q %systemdrive%\recycled\*.* 

@echo Delete the system directory backup files
del /f /s /q %windir%\*.bak 

@echo Delete the application temporary files 
del /f /s /q %windir%\prefetch\*.* 

@echo Echo delete system maintenance and other operations arising from the temporary file 
del /f /s /q %windir%\temp\*.* 

@echo Delete the current user's COOKIE (IE) 
del /f /s /q %userprofile%\cookies\*.* 

@echo Delete temporary internet files 
del /f /s /q "%userprofile%\local settings\temporary internet files\*.*" 

@echo Delete the current user temporary files 
del /f /s /q "%userprofile%\local settings\temp\*.*" 

@echo Delete access records (the start menu of the document inside the thing)
del /f /s /q "%userprofile%\recent\*.*"