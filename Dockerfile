FROM cloim/alpine

RUN apk update; apk add --no-cache \
    nginx \
    && rm -rf /var/www/localhost \
    && mkdir -p /etc/templates

COPY ./manifest/ /
RUN chmod u+rwx /entrypoint.sh

EXPOSE 80 443

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
