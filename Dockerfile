FROM mongo

RUN apt-get update \
    && apt-get install wget -qq --no-install-recommends \
    && wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | apt-key add - \
    && wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list \
    && apt-get update \
    && apt-get install s3cmd -qq --no-install-recommends

ADD main.sh /opt/main.sh

RUN chmod 777 /opt/main.sh

WORKDIR /

CMD ["/opt/main.sh"]
