FROM pemcconnell/docker-phpfpm:7.1-alpine
MAINTAINER Peter McConnell <me@petermcconnell.com>

RUN apk add --update \
      nginx \
      ca-certificates

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY run.sh /run.sh

CMD ["/run.sh"]
