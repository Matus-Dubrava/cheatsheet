### NodeJS Dockerfile using tini

about tini from official repository [https://github.com/krallin/tini](https://github.com/krallin/tini)

> Using Tini has several benefits:
>
> -   It protects you from software that accidentally creates zombie processes, which can (over time!) starve your entire system for PIDs (and make it unusable).
> -   It ensures that the default signal handlers work for the software you run in your Docker image. For example, with Tini, SIGTERM properly terminates your process even if you didn't explicitly install a signal handler for it.
> -   It does so completely transparently! Docker images that work without Tini will work with Tini without any changes.

```
FROM node:14-stretch-slim

ENV PORT 5000
ENV TINI_VERSION v0.19.0

EXPOSE $PORT

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

WORKDIR /node/app

COPY ./package*.json ./

RUN npm install && npm cache clean --force

COPY . .

ENTRYPOINT ["/tini", "--"]

CMD ["node", "index.js"]
```

#### building the image

```
docker build -t express-app .
```

#### running the container

expose port 5000 and run the container in the background

```
docker container run -p 5000:5000 -d --name express-app express-app
```

_working example can be found in the corresponding directory_
