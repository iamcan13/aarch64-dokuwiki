FROM alpine:3.5

ENV VERSION=1.28.1

RUN apk update && \
    apk add nginx php5 && \
    mkdir -p /run/nginx && \
    mkdir -p /nginx/conf /nginx/logs && \
    mkdir -p /mediawiki && \
    echo "hello world!"

ADD conf/nginx.conf /nginx/conf/nginx.conf
ADD scripts/wrapper /bin/wrapper
#RUN tar xvzf /tmp/mediawiki-${VERSION}.tar.gz

ENTRYPOINT ["/bin/wrapper"]
CMD ["/usr/sbin/nginx", "-c", "/nginx/conf/nginx.conf"]
