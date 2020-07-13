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