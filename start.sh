#!/bin/bash
cd /recoll-webui/
/usr/local/bin/gunicorn webui-wsgi:application -c /root/.recoll/gunicorn.conf
