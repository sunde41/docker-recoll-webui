#!/bin/bash

/usr/local/bin/gunicorn -c /root/.recoll/guni_config.py /recoll-webui/guni:app
