# /Dockerfile
FROM node:latest
WORKDIR /usr/blog
COPY ./ /usr/blog

RUN npm install
# install hexo
RUN npm install hexo-cli -g
# install hexo server
RUN npm install hexo-server
RUN npm install hexo-deployer-git
RUN hexo server -p 80
# set home dir