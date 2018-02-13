#!/bin/bash
cd /recoll-webui/
/usr/local/bin/gunicorn webui-wsgi:application -c /config/.recoll/gunicorn.conf
