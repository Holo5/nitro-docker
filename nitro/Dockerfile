FROM node:lts-alpine

WORKDIR /app

RUN apk update
RUN apk add bash
RUN apk add mysql-client
RUN apk add supervisor
RUN apk add rsync

RUN yarn global add http-server

# sass patch
RUN yarn remove node-sass
RUN yarn add sass

RUN yarn install