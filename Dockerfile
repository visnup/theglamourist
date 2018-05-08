FROM node:9.11.1-alpine@sha256:e9742137d0a73a0d2197363a04bf8e42c0e297a5c7ab1d0f43d735afca48bf9a

RUN mkdir /app
WORKDIR /app

COPY package.json package-lock.json* /app/
RUN npm install

COPY . /app/

RUN node_modules/.bin/next build
CMD node_modules/.bin/next start
