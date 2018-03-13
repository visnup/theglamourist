FROM node:9.8.0-alpine

RUN mkdir /app
WORKDIR /app

COPY package.json package-lock.json* /app/
RUN npm install

COPY . /app/

CMD node_modules/.bin/next
