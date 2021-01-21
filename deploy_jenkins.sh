#!/bin/bash

# Program:
#     deploy jenkins
# Version:
#     1.0.1
# History:
#     Created on 2018/08/15
#     Last modified on 2018/08/16

# 容器名称
CONTAINER="jenkins_demo"
# 镜像名称（以日期时间为镜像标签，防止重复）
IMAGE=$CONTAINER":"$(date -d "today" +"%Y%m%d_%H%M%S")

# 删除滚动更新残留的容器
sudo docker rm `docker ps -a | grep -w $CONTAINER"_"$CONTAINER | awk '{print $1}'`
# 强制删除滚动更新残留的镜像
sudo docker rmi --force `docker images | grep -w $CONTAINER | awk '{print $3}'`

# 创建新镜像
sudo docker build -t $IMAGE . && \

# 删除 docker-compose.jenkins.yml 文件，防止使用相同镜像
sudo rm -rf docker-compose.jenkins.yml && \

# 复制 docker-compose.src.yml 文件，防止污染原文件
sudo cp docker-compose.src.yml docker-compose.jenkins.yml && \

# 替换镜像名标志位为最新镜像
sudo sed -i s%IMAGE_LATEST%$IMAGE%g docker-compose.jenkins.yml && \

# 使用 docker stack 启动服务
sudo docker stack deploy -c docker-compose.jenkins.yml $CONTAINER
