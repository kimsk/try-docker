# Build: docker build -f node.dockerfile -t karlkim/node .

# Option 1: Start MongoDB and Node (legacy linking)
# docker run -d --name my-mongodb mongo

# Start Node and Link to MongoDB container
# Run: docker run -d -p 3000:3000 --link my-mongodb:mongodb karlkim/node

# Option 2: Create a custom (isolated) bridge network and add containes into it
# docker network create --driver bridge isolated_network
# docker run -d --net=isolated_network --name mongodb mongo
# docker run -d --net=isolated_network --name nodeapp -p 3000:3000 karlkim/node

# Seed the database with sample data
# Run: docker exec nodeapp node dbSeeder.js

# Checking network
# docker network ls
# docker network inspect isolated_network


FROM node:latest

MAINTAINER Karlkim

ENV NODE_ENV=production
ENV PORT=3000

COPY . /var/www
WORKDIR /var/www

RUN npm install

EXPOSE $PORT
ENTRYPOINT ["npm","start"]
