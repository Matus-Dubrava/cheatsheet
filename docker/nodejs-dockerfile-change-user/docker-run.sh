# build docker image
docker build -t express-app .

# verify that the user/group ownership of the /app directory has been changed
# to user - node
docker run -it --rm express-app ls -la