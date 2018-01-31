#!/bin/bash
echo "Starting Flask-ask"
python /spacegeek/spacegeek.py > /var/log/spacegeek.log&
echo "Starting Supervisord"
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
bash