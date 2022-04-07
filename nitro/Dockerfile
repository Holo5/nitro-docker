FROM node:lts-alpine

WORKDIR /app

RUN apk update
RUN apk add bash
RUN apk add mysql-client
RUN apk add supervisor
RUN apk add rsync

RUN yarn global add http-server

RUN yarn install

EXPOSE 8080
EXPOSE 8081