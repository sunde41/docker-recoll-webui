FROM debian:jessie
MAINTAINER sunde41

RUN echo deb http://www.lesbonscomptes.com/recoll/debian/ unstable main > \
	/etc/apt/sources.list.d/recoll.list

RUN echo deb-src http://www.lesbonscomptes.com/recoll/debian/ unstable main >> \
	/etc/apt/sources.list.d/recoll.list

RUN apt-get update && \
    apt-get install -y --force-yes recoll python-recoll python python-pip git wv aspell aspell-en pdftk poppler-utils && \
    apt-get clean
    
RUN mkdir /data && mkdir /root/.recoll	
RUN git clone https://github.com/koniu/recoll-webui.git
RUN pip install epub gunicorn

ADD recoll.conf /root/.recoll/recoll.conf

ADD guni.py /recoll-webui/
ADD guni_config.py /root/.recoll/

VOLUME /data
EXPOSE 8080

CMD ["/usr/local/bin/gunicorn","-c","/root/.recoll/guni_config.py","/recoll-webui/guni:app"]
