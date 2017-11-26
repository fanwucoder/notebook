@echo off
del stream\*.log
:A
set ymd=%date:~0,4%-%date:~5,2%-%date:~8,2%
set hms=%time:~0,2%%time:~3,2%%time:~6,2%%time:~9,2%
set dt=access.%ymd%_%hms%.log
rem echo %dt%
python genlog.py >test.log
copy test.log stream\tmp\%dt%
move stream\tmp\%dt% stream\
ping -n 1 127.0.0.1>nul
goto A