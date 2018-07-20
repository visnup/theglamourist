FROM node:9.11.2-alpine@sha256:5aa0756284c7f0222c2c16988fb58d6446427ac7ae8891aa50a2de721ef4191c

RUN mkdir /app
WORKDIR /app

COPY package.json package-lock.json* /app/
RUN npm install

COPY . /app/

RUN node_modules/.bin/next build
CMD node_modules/.bin/next start
