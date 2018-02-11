#!/bin/bash

/usr/local/bin/gunicorn /recoll-webui/guni:app --bind='0.0.0.0:8080'
