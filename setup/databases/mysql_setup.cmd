set DB_DATA_ROOT=dbtest
set CONNECTION=fedora42

echo mysql setup : 8.0.42, 8.4.5, 9.2.0
call :start_mysql 8.0.42  8406
call :start_mysql 8.4.5   8407
call :start_mysql 9.2.0   8408

goto :eof


:start_mysql
set "VERSION=%1"
set "PORT=%2"
set "NAME=mysql%VERSION%"
set "DAT=%DB_DATA_ROOT%-%NAME%"
set CFG=--user root --restart unless-stopped -v %DAT%:/var/lib/mysql:Z -p %PORT%:3306
podman --connection=%CONNECTION% run --name %CONNECTION%-%NAME% %CFG% -e MYSQL_ROOT_PASSWORD=%NAME% -d docker.io/library/mysql:%VERSION%
goto :eof
