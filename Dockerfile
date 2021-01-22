# /Dockerfile
FROM node:12-alpine
WORKDIR /blog

RUN cd blog \
&& npm install hexo-cli -g \
&& npm install \

EXPOSE 5000
ENTRYPOINT ["hexo", "clean"]  
ENTRYPOINT ["hexo", "g"]  
ENTRYPOINT ["hexo", "d"]  