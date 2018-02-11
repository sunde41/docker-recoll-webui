#!/bin/bash
/bin/bash /root/bgindex.sh &
cd /recoll-webui/
/usr/local/bin/gunicorn webui-standalone:app -a 0.0.0.0
