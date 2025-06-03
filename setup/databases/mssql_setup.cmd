set DB_DATA_ROOT=dbtest
set CONNECTION=fedora42

echo mariadb setup : 2017, 2019, 2022
call :start_mssql 2017 8533
call :start_mssql 2019 8534
call :start_mssql 2022 8535

rem goto :eof


:start_mssql
set "VERSION=%1"
set "PORT=%2"
set "NAME=mssql%VERSION%"
set "DAT=%DB_DATA_ROOT%-%NAME%"
set CFG=--user root --restart unless-stopped -v %DAT%:/var/opt/mssql:Z  -p %PORT%:1433 -e ACCEPT_EULA=Y
podman --connection=%CONNECTION% run --name %CONNECTION%-%NAME% %CFG% -e MSSQL_SA_PASSWORD=%NAME%$1223456 -d mcr.microsoft.com/mssql/server:%VERSION%-latest
goto :eof
