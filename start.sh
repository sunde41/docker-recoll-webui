cd /recollwebui-code
/usr/local/bin/gunicorn webui-wsgi:application -c /root/gunicorn.conf
