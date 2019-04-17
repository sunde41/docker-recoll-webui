cd /recollwebui-code
/usr/bin/gunicorn webui-wsgi:application -c /root/gunicorn.conf
