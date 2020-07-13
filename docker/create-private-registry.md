# Create private local docker registry

run registry within a container

-   registry listens on port 5000
-   volume should be mounted to /var/lib/registry

```
docker container run -p 5000:5000 -d -v registry-data:/var/lib/registry --name registry registry
```

image to be stored in private registry

```
docker pull hello-world
```

image needs to be correctly tagged before it can be pushed to the local registry

```
docker tag hello-world:latest 127.0.0.1:5000/hello-world
```

push the image to the registry

```
docker push 127.0.0.1:5000/hello-world
```

_working example can be found in the corresponding directory_
