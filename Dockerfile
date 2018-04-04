FROM node:9.10.1-alpine@sha256:2d1f09a148aac3b093a9610979721069430864c2cfa98b12a7144861abbb4f54

RUN mkdir /app
WORKDIR /app

COPY package.json package-lock.json* /app/
RUN npm install

COPY . /app/

RUN node_modules/.bin/next build
CMD node_modules/.bin/next start
