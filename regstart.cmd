mkdir C:/registry
podman run --privileged -d --name registry -p 5000:5000 -v C:/registry:/var/lib/registry:z --restart=always registry