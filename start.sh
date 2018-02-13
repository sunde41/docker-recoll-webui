#!/bin/bash
echo bind='0.0.0.0:8080' > /root/gunicorn.conf
cd /recoll-webui/
/usr/local/bin/gunicorn webui-wsgi:application -c /root/gunicorn.conf
