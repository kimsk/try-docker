FROM node:latest

MAINTAINER Karlkim

ENV NODE_ENV=production
ENV PORT=3000

COPY . /var/www
WORKDIR /var/www

RUN npm install

EXPOSE $PORT
ENTRYPOINT ["npm","start"]
