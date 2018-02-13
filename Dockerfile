FROM debian:jessie
MAINTAINER sunde41

VOLUME /config

RUN echo deb http://www.lesbonscomptes.com/recoll/debian/ jessie main > \
	/etc/apt/sources.list.d/recoll.list &&\
    echo deb-src http://www.lesbonscomptes.com/recoll/debian/ jessie main >> \
	/etc/apt/sources.list.d/recoll.list &&\
    apt-get -qq update && \
    apt-get -qq --force-yes install \
        recoll python-recoll \
        python python-pip git wv \
        aspell aspell-en \
        poppler-utils && \
    apt-get autoremove && apt-get clean && \
    mkdir /data && mkdir -p /config/.recoll && \
    git clone https://github.com/koniu/recoll-webui.git && \
    pip install epub gunicorn

ADD start.sh /config/
ADD recoll.conf /config/.recoll/
ADD gunicorn.conf /config/

RUN chmod +x /config/start.sh

EXPOSE 8080
