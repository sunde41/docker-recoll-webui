FROM debian:jessie-slim
MAINTAINER sunde41

RUN echo deb http://www.lesbonscomptes.com/recoll/debian/ jessie main > \
	/etc/apt/sources.list.d/recoll.list && \
    echo deb-src http://www.lesbonscomptes.com/recoll/debian/ jessie main >> \
	/etc/apt/sources.list.d/recoll.list && \
    apt-get -qq update && \
    apt-get -qq --force-yes install \
        recoll python-recoll \
        python-pip git antiword wv unzip mercurial \
	aspell aspell-en \
	pdftk \
        poppler-utils && \
    apt-get autoremove && apt-get clean && \
    mkdir /data && mkdir -p /root/.recoll && \
    git clone https://@opensourceprojects.eu/git/p/recollwebui/code recollwebui-code && \
    hg clone https://bitbucket.org/arthurdarcet/epub
    cd epub
    python setup.py install
    pip install epub gunicorn

EXPOSE 80

ADD start.sh /
RUN chmod +x /start.sh
CMD '/start.sh'
