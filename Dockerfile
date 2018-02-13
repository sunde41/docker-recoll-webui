FROM debian:jessie
MAINTAINER sunde41

RUN echo deb http://www.lesbonscomptes.com/recoll/debian/ jessie main > \
	/etc/apt/sources.list.d/recoll.list &&\
    echo deb-src http://www.lesbonscomptes.com/recoll/debian/ jessie main >> \
	/etc/apt/sources.list.d/recoll.list &&\
    apt-get -qq update && \
    apt-get -qq --force-yes install \
        recoll python-recoll \
        python python-pip git wv wget \
        aspell aspell-en \
        pdftk \
        poppler-utils && \
    apt-get autoremove && apt-get clean && \
    mkdir /data && mkdir -p /config/.recoll && \
    git clone https://github.com/koniu/recoll-webui.git && \
    pip install epub gunicorn && \
    cd /config && \
    wget https://raw.githubusercontent.com/sunde41/docker-recoll-webui/master/start.sh

ADD start.sh /root/
ADD start.sh /config/
COPY gunicorn.conf /config/gunicorn.conf
ADD recoll.conf /config/.recoll/
ADD gunicorn.conf /config/.recoll/

VOLUME ['/data']

EXPOSE 8080
