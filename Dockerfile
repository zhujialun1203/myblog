# /Dockerfile
FROM node:latest
WORKDIR /usr/blog
COPY ./ /usr/blog
RUN cd blog
# install hexo
RUN npm install hexo-cli -g
RUN npm install
# install hexo server
RUN hexo server -p 80
# set home dir