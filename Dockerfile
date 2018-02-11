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
    mkdir /data && mkdir -p /root/.recoll && \
    git clone https://github.com/koniu/recoll-webui.git && \
    pip install epub gunicorn && \
    cd /root && \
    wget https://raw.githubusercontent.com/sunde41/docker-recoll-webui/master/start.sh

ADD recoll.conf /root/.recoll/recoll.conf
ADD gunicorn.conf /root/.recoll/gunicorn.conf

VOLUME /data
VOLUME /root
EXPOSE 8080

RUN chmod +x /root/start.sh
CMD ['/root/start.sh']
