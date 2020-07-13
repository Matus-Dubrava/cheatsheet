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