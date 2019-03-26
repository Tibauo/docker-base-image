#!/bin/bash -ex

docker_image_name=$1
if [ -z "$docker_image_name" ]; then
 docker_image_name=debian-base:latest
fi

distrib=$2
if [ -z "$distrib" ]; then 
  distrib=debian
fi

export distrib

version=$3
if [ -z "$version" ]; then
   version=stretch
fi

export version
export destdir=./image

pkg=locales,apt-utils,inetutils-ping,iproute2
url=http://deb.debian.org/debian

export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive

bash -x  /root/components/engine/contrib/mkimage.sh -t $docker_image_name -d $destdir debootstrap --variant=minbase --components=main --include=$pkg $version $url
