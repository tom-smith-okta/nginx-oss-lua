# build
# docker build -t nginx-oss-lua .

# run CLI
# docker run -it nginx-oss-lua /bin/bash

# run web server
# docker run -d -p 8112:80 nginx-oss-lua nginx -g 'daemon off;'

# web server with logs
# docker run -d -p 8112:80 -v {{MY_LOG_PATH}}:/var/log/nginx nginx-oss-lua nginx -g 'daemon off;'

FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
	build-essential \
	curl \
	devscripts \
	git \
	libluajit-5.1-dev \
	libpcre3-dev \
	libssl-dev \
	lintian \
	lsb-core \
	lua5.1 \
	make \
	mercurial \
	quilt \
	wget

RUN curl -O http://nginx.org/keys/nginx_signing.key

RUN apt-key add nginx_signing.key

RUN echo "deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx" >> /etc/apt/sources.list
RUN echo "deb-src http://nginx.org/packages/mainline/ubuntu/ xenial nginx" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y nginx

RUN curl -sS http://hg.nginx.org/pkg-oss/raw-file/default/build_module.sh | bash -s - -y --skip-depends https://github.com/openresty/lua-nginx-module.git

COPY conf/nginx.conf /etc/nginx/nginx.conf