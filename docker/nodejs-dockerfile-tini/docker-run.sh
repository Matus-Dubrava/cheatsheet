# build docker image
docker build -t express-app .

# run docker container from the above image 
docker container run -p 5000:5000 -d --name express-app express-app

# get response from the running container
sleep 2 && curl localhost:5000

# remove the running container
docker container rm -f express-app