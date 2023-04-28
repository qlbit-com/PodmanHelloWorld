call gradlew.bat jar jib
set CNT=hello_123
set IMG=localhost:5000/my-image/built-with-jib:latest
podman rm %CNT%
podman pull %IMG%
podman run --name %CNT% -p 5005:5005 %IMG%