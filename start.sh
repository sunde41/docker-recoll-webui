#!/bin/bash
cd /recoll-webui/
/usr/local/bin/gunicorn guni:app --bind='0.0.0.0:8080'
