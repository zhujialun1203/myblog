# /Dockerfile
FROM node:latest
WORKDIR /usr/blog
COPY ./ /usr/blog
RUN cd blog \
&& npm install hexo-cli -g \
&& npm install \
&& hexo server -p 80\
