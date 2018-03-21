FROM node:9.8.0-alpine@sha256:0fb8f93d4667e714a52d78a3cd6ec754867d3acabb3a5bab93b31cf6d851d4e2

RUN mkdir /app
WORKDIR /app

COPY package.json package-lock.json* /app/
RUN npm install

COPY . /app/

RUN node_modules/.bin/next build
CMD node_modules/.bin/next start
