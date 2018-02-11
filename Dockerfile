FROM debian:jessie
MAINTAINER sunde41

ADD start.sh /root/

RUN echo deb http://www.lesbonscomptes.com/recoll/debian/ unstable main > \
	/etc/apt/sources.list.d/recoll.list

RUN echo deb-src http://www.lesbonscomptes.com/recoll/debian/ unstable main >> \
	/etc/apt/sources.list.d/recoll.list

RUN apt-get update && \
    apt-get install -y --force-yes recoll python-recoll python python-pip git wv poppler-utils && \
    apt-get clean
    
RUN apt-get install -y --force-yes aspell aspell-en pdftk 

RUN mkdir /root/.recoll

RUN git clone https://github.com/koniu/recoll-webui.git

RUN pip install epub gunicorn

ADD recoll.conf /root/.recoll/recoll.conf

ADD guni.py /recoll-webui/

VOLUME /root
EXPOSE 8080

RUN chmod +x /root/start.sh
