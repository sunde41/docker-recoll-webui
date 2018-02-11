FROM debian:jessie
MAINTAINER sunde41

ADD start.sh /root/
ADD bgindex.sh /root/

RUN echo deb http://www.lesbonscomptes.com/recoll/debian/ jessie main > \
	/etc/apt/sources.list.d/recoll.list &&\
    echo deb-src http://www.lesbonscomptes.com/recoll/debian/ jessie main >> \
	/etc/apt/sources.list.d/recoll.list &&\
    apt-get -qq update && \
    apt-get -qq --force-yes install \
        recoll python-recoll \
        python git wv \
        aspell aspell-de aspell-en \
        pdftk \
        poppler-utils && \
    apt-get autoremove && apt-get clean &&\
    mkdir /homes && mkdir -p /root/.recoll &&\
    git clone https://github.com/sunde41/recoll-webui.git &&\
    chmod +x /root/start.sh

ADD recoll.conf /root/.recoll/recoll.conf

VOLUME /homes
EXPOSE 8080

CMD ["/root/start.sh"]
