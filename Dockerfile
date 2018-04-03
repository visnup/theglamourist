FROM node:9.10.1-alpine@sha256:d662f383626a23aa0b13d612b3e12da4faa51ea8d557883a33264df0b67ba5cc

RUN mkdir /app
WORKDIR /app

COPY package.json package-lock.json* /app/
RUN npm install

COPY . /app/

RUN node_modules/.bin/next build
CMD node_modules/.bin/next start
