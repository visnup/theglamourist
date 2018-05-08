FROM node:9.10.1-alpine@sha256:7fc98f88a595ac80b39bc2bcf7a9a78898f2975f127af6d6a97e82d0f62d96a5

RUN mkdir /app
WORKDIR /app

COPY package.json package-lock.json* /app/
RUN npm install

COPY . /app/

RUN node_modules/.bin/next build
CMD node_modules/.bin/next start
