# run registry as a container
# - listens on port 5000
# - volume should be mounted to /var/lib/registry
docker container run -p 5000:5000 -d -v registry-data:/var/lib/registry --name registry registry

# image to be stored in private registry
docker pull hello-world

# tag the image 
docker tag hello-world:latest 127.0.0.1:5000/hello-world

# push the image to the registry
docker push 127.0.0.1:5000/hello-world

