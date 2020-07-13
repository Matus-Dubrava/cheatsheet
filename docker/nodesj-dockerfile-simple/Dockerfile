FROM node:14-stretch-slim

ENV PORT 5000
EXPOSE $PORT

COPY ./package*.json ./

RUN npm install && npm cache clean --force

COPY . .

CMD ["node", "index.js"]