nginxIp=`hostname -i`
sed -i "s/NginxIp/${nginxIp}/g" /etc/nginx/nginx.conf

if   [   $BACKEND_URL  ];
then
   sed -i "s!YourBackendUrl!${BACKEND_URL}!g" /etc/nginx/nginx.conf
   echo "config $BACKEND_URL"
else
   echo "plase set $Backend when start nginx docker, e.g. docker run  -e 'Backend_Url=http://tracing-analysis-dc-sz.aliyuncs.com/adapt_***"
fi
if [ $SKYNGINX ]; then
  sed -i "s!skyNginx!${SKYNGINX}!g" /etc/nginx/nginx.conf
fi
nginx -c /etc/nginx/nginx.conf &
nginx -c /etc/nginx/nginx_8080.conf &
tail -f /usr/local/src/start.sh
