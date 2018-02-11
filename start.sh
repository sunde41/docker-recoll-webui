#!/bin/bash

/usr/local/bin/gunicorn -c /recoll-webui/guni_config.py /recoll-webui/guni:app
