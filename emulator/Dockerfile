FROM openjdk:8-jdk-alpine

WORKDIR /app

RUN apk update
RUN apk add openjdk8
RUN apk add bash
RUN apk add maven
RUN apk add mysql-client
RUN apk add supervisor

EXPOSE 3000
EXPOSE 3001
EXPOSE 2096