# Log to the semi-standard /dev/log unix socket. This can be mounted from an
# external container to centralize logging.
if [ -n "`getent hosts | grep ' syslog '`" ];
then
  echo 'access_log syslog:server=syslog:514,facility=local7,tag=nginx,severity=info;' > /etc/nginx/conf.d/logging.conf
  echo 'error_log syslog:server=syslog:514,facility=local7,tag=nginx,severity=info;' >> /etc/nginx/conf.d/logging.conf
else
  echo 'access_log /var/log/nginx/access.log;' > /etc/nginx/conf.d/logging.conf
  echo 'error_log /var/log/nginx/error.log;' >> /etc/nginx/conf.d/logging.conf
fi

service nginx start