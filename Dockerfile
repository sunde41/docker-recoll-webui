FROM debian:stretch-slim
MAINTAINER sunde41

RUN apt-get update && \
    apt-get install -y apt-transport-https git

RUN echo deb https://www.lesbonscomptes.com/recoll/debian/ stretch main > \
	/etc/apt/sources.list.d/recoll.list

RUN echo deb-src https://www.lesbonscomptes.com/recoll/debian/ stretch main >> \
	/etc/apt/sources.list.d/recoll.list

RUN apt-get update && \
    apt-get install -y --allow-unauthenticated --force-yes recollcmd python3-recoll \
    gunicorn3 && \
    apt-get autoremove && apt-get clean

RUN mkdir /data && mkdir -p /root/.recoll && \
    git clone https://framagit.org/medoc92/recollwebui.git

EXPOSE 80

ADD start.sh /
ADD gunicorn.conf /root/
ADD recoll.conf /root/.recoll/
RUN chmod +x /start.sh
CMD '/start.sh'
