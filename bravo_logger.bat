@ECHO OFF
SETLOCAL
SET LOG="%USERPROFILE%\Desktop\hal_errors.log"
SET SCRIPT="%USERPROFILE%\Repos\standalone_scripts\upload_robot_logs.py"
SET STB_CONF="%USERPROFILE%\Repos\statusdb.yaml"
SET STB_LOG="%USERPROFILE%\Repos\statusdb_upload.log"
FOR /F "TOKENS=2-4 DELIMS=/ " %%A IN ('DATE /T') DO (SET TODAY=%%C-%%A-%%B)
FOR /F "TOKENS=1-2 DELIMS=/:" %%A IN ("%TIME%") DO (SET NOW=%%A:%%B)
IF NOT EXIST %LOG% TYPE NUL > %LOG%
ECHO %TODAY% %NOW% %* >> %LOG%
ECHO %* | python %SCRIPT% --name "HAL" --conf %STB_CONF% --logfile %STB_LOG%
