FROM debian:latest
RUN apt update \
 && apt upgrade -y \
 && apt install -y git sudo
RUN apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common \
 && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \
 && add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable" \
 && apt update \
 && apt install -y docker-ce
RUN cd root \
 && git init \
 && git remote add -f origin https://github.com/docker/docker-ce.git \
 && echo "some/dir/" >> .git/info/sparse-checkout \
 && rm -rf .git/info/sparse-checkout \
 && git config core.sparseCheckout true \
 && echo "components/engine/contrib/" >> .git/info/sparse-checkout \
 && git pull origin master
COPY build-debian.sh /tmp
RUN apt install -y debootstrap
