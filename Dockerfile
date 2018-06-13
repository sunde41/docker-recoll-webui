FROM debian:stretch
MAINTAINER sunde41

RUN echo deb http://www.lesbonscomptes.com/recoll/debian/ stretch main > \
	/etc/apt/sources.list.d/recoll.list &&\
    echo deb-src http://www.lesbonscomptes.com/recoll/debian/ stretch main >> \
	/etc/apt/sources.list.d/recoll.list &&\
    apt-get -qq update && \
    apt-get -qq --force-yes install \
        recoll python-recoll \
        python python-pip git wv \
        aspell aspell-en \
        poppler-utils && \
    apt-get autoremove && apt-get clean && \
    mkdir /data && mkdir -p /root/.recoll && \
    git clone https://github.com/Yetangitu/recoll-webui.git && \
    pip install epub gunicorn

EXPOSE 80

ADD start.sh /
RUN chmod +x /start.sh
CMD '/start.sh'
