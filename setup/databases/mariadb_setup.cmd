set DB_DATA_ROOT=dbtest
set CONNECTION=fedora42

echo mariadb setup : 10.6.22, 10.11.13, 11.4.7 
call :start_mariadb 10.6.22  8306
call :start_mariadb 10.11.13 8307
call :start_mariadb 11.4.7   8308

goto :eof


:start_mariadb
set "VERSION=%1"
set "PORT=%2"
set "NAME=mariadb%VERSION%"
set "DAT=%DB_DATA_ROOT%-%NAME%"
set CFG=--user root --restart unless-stopped -v %DAT%:/var/lib/mysql:Z -p %PORT%:3306
podman --connection=%CONNECTION% run --name %CONNECTION%-%NAME% %CFG% -e MARIADB_ROOT_PASSWORD=%NAME% -d docker.io/library/mariadb:%VERSION%
goto :eof
