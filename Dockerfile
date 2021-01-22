FROM node:12-alpine
#基于alpine的node镜像，这样就不用下载node了

WORKDIR /blog
#工作区在/Bolg，接下来的命令和语句都是在/Blog下执行的

RUN echo "Asia/Shanghai" > /etc/timezone \
    && echo "https://mirrors.ustc.edu.cn/alpine/v3.9/main/" > /etc/apk/repositories  \
    && npm config set registry https://registry.npm.taobao.org \
    && apk add --no-cache git \
    && npm install hexo-cli -g \
    && hexo init \
    && npm install \
    && npm install hexo-deployer-git --save \
    && npm install hexo-generator-json-content@2.2.0 --save \
    && npm install hexo-renderer-jade@0.3.0 --save \
    && npm install hexo-renderer-stylus --save \
    && rm -rf source themes \
    && git config --global user.email "1154562398@qq.com" \
    && git config --global user.name "幻期颐" 
#以上都是在安装配置git和Hexo，使用hexo-deployer-git插件推送到远端，
#另外三个插件是我选的主题所需要的，可以不安装

# ADD themes ./themes
# ADD _config.yml ./
#将主题文件夹拷贝到镜像中，主配置文件拷贝到镜像中，这些都是在宿主机中配置好

EXPOSE 5000
#暴露5000端口，Hexo server在Docker中是4000,但主机的4000端口貌似经常被占用

ENTRYPOINT ["hexo", "clean"]  
ENTRYPOINT ["hexo", "g"]  
ENTRYPOINT ["hexo", "d"]  