#!/bin/bash
cd /recoll-webui/
/usr/local/bin/gunicorn webui-standalone:app -a 0.0.0.0
