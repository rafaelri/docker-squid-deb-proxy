FROM alpine:3.7
ENV LANG C.UTF-8
RUN set -x \
	&& apk add --no-cache squid
ADD etc /etc/squid-deb-proxy
ADD share /usr/share/squid-deb-proxy
ADD /docker-entrypoint.sh /
ENTRYPOINT [ "/docker-entrypoint.sh" ]
VOLUME [ "/var/cache/squid-deb-proxy" ]
CMD [ "squid-deb-proxy" ]
EXPOSE 8000

