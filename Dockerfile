FROM node:8.16.1-alpine

RUN mkdir /app
WORKDIR /app

COPY package.json yarn.lock* /app/
RUN yarn

COPY . /app/

# RUN node_modules/.bin/next build
CMD node_modules/.bin/next start
