FROM debian:jessie
MAINTAINER sunde41

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
    mkdir /data && mkdir -p /root/.recoll && \
    git clone https://github.com/koniu/recoll-webui.git && \
    pip install epub gunicorn

EXPOSE 8080

RUN echo bind='"0.0.0.0:8080"' > /root/gunicorn.conf
RUN cd /recoll-webui/

CMD /usr/local/bin/gunicorn webui-wsgi:application -c /root/gunicorn.conf

# CMD ['sh','/start.sh']
