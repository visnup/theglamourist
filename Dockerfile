FROM node:9.8.0-alpine@sha256:551f3d5b0d41d09a4e68a2200332bebf00367090fb21d999bad95b97611aab83

RUN mkdir /app
WORKDIR /app

COPY package.json package-lock.json* /app/
RUN npm install

COPY . /app/

RUN node_modules/.bin/next build
CMD node_modules/.bin/next start
