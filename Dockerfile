FROM node:9.11.1-alpine@sha256:991c1808b9702a34e4eb04092065e968e70b6a7f190a63192daf35c31e4c14af

RUN mkdir /app
WORKDIR /app

COPY package.json package-lock.json* /app/
RUN npm install

COPY . /app/

RUN node_modules/.bin/next build
CMD node_modules/.bin/next start
