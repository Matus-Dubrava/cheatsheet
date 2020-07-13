# Change default root user to user - node

```
FROM node:14-stretch-slim

ENV PORT 5000

EXPOSE $PORT

WORKDIR /node/app

COPY ./package*.json ./

# run npm install as root in case of global installs
RUN npm install && npm cache clean --force \
    && chown -R node:node .

USER node

COPY --chown=node:node . .

CMD ["node", "index.js"]
```

## building the image

```
docker build -t express-app .
```

## verify the user/group ownership

```
docker run -it --rm express-app ls -la
```

_working example can be found in the corresponding directory_
