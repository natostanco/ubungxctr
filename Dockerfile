FROM ubuntu:latest

ENTRYPOINT ["nginx"]

RUN apt-get update
RUN \
	apt-get upgrade -y -q -o Dpkg::Options::="--force-confold" \
	&& apt-get install nginx curl wget -y -q
RUN wget `curl -s https://api.github.com/repos/natostanco/ubungxpgs/releases | grep browser_download_url | head -n 1 | cut -d '"' -f 4` -O ngx.tar.gz
RUN tar -zxf ngx.tar.gz \
	&& rm ngx.tar.gz \
	&& mv nginx /usr/sbin/nginx #\
#	&& rm -rf /etc/nginx
RUN mkdir -p /var/run/nginx \
 && mkdir -p /etc/nginx \
 && mkdir -p /var/log/nginx \
 && mkdir -p /var/lib/nginx/tmp

#VOLUME ["/etc/coconf/nginx","/etc/nginx"]

EXPOSE 80

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
