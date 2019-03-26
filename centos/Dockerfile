FROM centos:latest
RUN yum update -y \
 && yum install -y git 
RUN yum install -y yum-utils device-mapper-persistent-data lvm2 \
 && yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
 && yum install -y docker-ce docker-ce-cli containerd.io
COPY build-centos.sh /tmp
