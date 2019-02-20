@ECHO OFF
SETLOCAL
SET SMTP="send.ki.se"
SET FROM="hal@scilifelab.se"
SET TO=%1
SET SUB=%2
SET BODY=%3

:: A custom Python script:
SET MAILSCRIPT="%USERPROFILE%\Repos\standalone_scripts\bravo_mailer.py"
python %MAILSCRIPT% -t %TO% -f %FROM% -s %SUB% -b %BODY% --smtp %SMTP%
