FROM node:20.2.0-alpine3.18

WORKDIR /app

RUN apk update
RUN apk add bash
RUN apk add mysql-client
RUN apk add supervisor
RUN apk add rsync

RUN yarn global add http-server

RUN yarn install