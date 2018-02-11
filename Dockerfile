FROM debian:jessie
MAINTAINER sunde41

ADD start.sh /root/
ADD recoll.conf /root/.recoll/recoll.conf
ADD gunicorn.conf /config/.recoll/gunicorn.conf

RUN echo deb http://www.lesbonscomptes.com/recoll/debian/ jessie main > \
	/etc/apt/sources.list.d/recoll.list &&\
    echo deb-src http://www.lesbonscomptes.com/recoll/debian/ jessie main >> \
	/etc/apt/sources.list.d/recoll.list &&\
    apt-get -qq update && \
    apt-get -qq --force-yes install \
        recoll python-recoll \
        python python-pip git wv \
        aspell aspell-en \
        pdftk \
        poppler-utils && \
    apt-get autoremove && apt-get clean &&\
    mkdir /data && mkdir -p /root/.recoll &&\
    git clone https://github.com/koniu/recoll-webui.git &&\
    pip install epub gunicorn &&\
    chmod +x /root/start.sh

VOLUME /data
EXPOSE 8080

CMD ["/root/start.sh"]
