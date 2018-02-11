#!/bin/bash
cd /recoll-webui/
/usr/local/bin/gunicorn webui-wsgi:application --bind='0.0.0.0:8080'
