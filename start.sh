cd /recollwebui
/usr/bin/gunicorn3 webui-wsgi:application -c /root/gunicorn.conf
