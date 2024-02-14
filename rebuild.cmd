call gradlew.bat jar jib
set CNT=PodmanHelloWorld
set IMG=localhost:5000/com.qlbit/podman-hello-world:latest
podman rm %CNT%
podman pull %IMG%
podman run --name %CNT% -p 5005:5005 %IMG%