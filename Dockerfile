FROM node:9.9.0-alpine@sha256:557d7da13de4cf16b543a764305a2630f8598179ca403d3814fae6e16f63b197

RUN mkdir /app
WORKDIR /app

COPY package.json package-lock.json* /app/
RUN npm install

COPY . /app/

RUN node_modules/.bin/next build
CMD node_modules/.bin/next start
