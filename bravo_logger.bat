@ECHO OFF
SETLOCAL
SET LOG_PATH="Y:\Bravo\bravo_logs\"
SET LOG_FILE="hal_errors.log"
IF NOT EXIST %LOG_PATH% (SET LOG_PATH="%USERPROFILE%\Desktop\")
SET SCRIPT="%USERPROFILE%\Repos\standalone_scripts\upload_robot_logs.py"
SET STB_CONF="%USERPROFILE%\Repos\statusdb.yaml"
SET STB_LOG="%USERPROFILE%\Repos\statusdb_upload.log"
FOR /F "TOKENS=1-3 DELIMS=- " %%A IN ('DATE /T') DO (SET TODAY=%%A-%%B-%%C)
FOR /F "TOKENS=1-2 DELIMS=/:" %%A IN ("%TIME%") DO (SET NOW=%%A:%%B)
ECHO %TODAY% %NOW% %* >> %LOG_PATH%%LOG_FILE%
ECHO %* | python %SCRIPT% --name "HAL" --conf %STB_CONF% --logfile %STB_LOG%
