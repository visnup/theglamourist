FROM node:9.4.0-alpine

RUN mkdir /app
WORKDIR /app

COPY package.json package-lock.json* /app/
RUN npm install

CMD node_modules/.bin/next
