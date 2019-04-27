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
    gunicorn && \
    apt-get autoremove && apt-get clean

RUN mkdir /data && mkdir -p /root/.recoll && \
    git clone https://@opensourceprojects.eu/git/p/recollwebui/code recollwebui

EXPOSE 80

ADD start.sh /
RUN chmod +x /start.sh
CMD '/start.sh'
