FROM debian:jessie
MAINTAINER sunde41

RUN echo deb http://www.lesbonscomptes.com/recoll/debian/ unstable main > \
	/etc/apt/sources.list.d/recoll.list
RUN echo deb-src http://www.lesbonscomptes.com/recoll/debian/ unstable main >> \
	/etc/apt/sources.list.d/recoll.list
RUN apt-get update && \
    apt-get install -y --force-yes recoll python-recoll python python-pip git wv aspell aspell-en pdftk poppler-utils && \
    apt-get autoremove && apt-get clean
RUN mkdir /data && mkdir -p /config/.recoll	
RUN git clone https://github.com/sunde41/recoll-webui.git
RUN pip install epub gunicorn

ADD recoll.conf /config/.recoll/
ADD guni_config.py /config/.recoll/

VOLUME /data
VOLUME /config
EXPOSE 8080
