### Basic NodeJS dockerfile

```
FROM node:14-stretch-slim

ENV PORT 5000

EXPOSE $PORT

COPY ./package*.json ./

RUN npm install && npm cache clean --force

COPY . .

CMD ["node", "index.js"]
```

#### building the image

```
docker build -t express-app .
```

#### running the container

```
docker container run -p 5000:5000 -d --name express-app express-app
```

working example can be found in the corresponding directory
