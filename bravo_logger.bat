@ECHO OFF
SETLOCAL
SET LOG_PATH="Z:\Bravo\bravo_logs\"
SET LOG_FILE="ash_errors.log"
IF NOT EXIST %LOG_PATH% (SET LOG_PATH="%USERPROFILE%\Desktop\")
SET SCRIPT="%USERPROFILE%\Repos\standalone_scripts\upload_robot_logs.py"
SET STB_CONF="%USERPROFILE%\Repos\statusdb.yaml"
SET STB_LOG="%USERPROFILE%\Repos\statusdb_upload.log"
FOR /F "DELIMS=" %%A IN ('DATE /T') DO (SET TODAY=%%A)
FOR /F "TOKENS=1-2 DELIMS=/:" %%A IN ("%TIME%") DO (SET NOW=%%A:%%B)
ECHO %TODAY% %NOW% %* >> %LOG_PATH%%LOG_FILE%
ECHO %* | python %SCRIPT% --name "Ash" --conf %STB_CONF% --logfile %STB_LOG%