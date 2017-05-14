FROM aarch64/php:7.1-apache

COPY dokuwiki.tgz /tmp/
COPY wrapper /bin/

RUN echo "start!" && \
    cd /tmp && \
    tar xvzf dokuwiki.tgz && \
    mv /tmp/dokuwiki /dokuwiki && \
    chmod -R 777 /dokuwiki/conf && \
    chmod -R 777 /dokuwiki/data && \
    chmod -R 777 /dokuwiki/lib/plugins && \
    chmod -R 777 /dokuwiki/lib/tpl && \
    ln -s /dokuwiki /var/www/html/dokuwiki

ENTRYPOINT ["/bin/wrapper"]
CMD ["/usr/sbin/apache2", "-DNO_DETACH", "-DFOREGROUND"]
