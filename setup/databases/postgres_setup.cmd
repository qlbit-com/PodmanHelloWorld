set DB_DATA_ROOT=dbtest
set CONNECTION=fedora42

echo postgres setup : 14.18, 15.13, 16.9, 17.5
call :start_postgres 14.18  8432
call :start_postgres 15.13  8433
call :start_postgres 16.9   8434
call :start_postgres 17.5   8435

goto :eof

:start_postgres
set "VERSION=%1"
set "PORT=%2"
set "NAME=postgres%VERSION%"
set "DAT=%DB_DATA_ROOT%-%NAME%"
set CFG=--user root --restart unless-stopped -v %DAT%:/var/lib/postgresql/data:Z -p %PORT%:5432
podman --connection=%CONNECTION% run --name %CONNECTION%-%NAME% %CFG% -e POSTGRES_PASSWORD=%NAME% -d docker.io/library/postgres:%VERSION%
goto :eof
