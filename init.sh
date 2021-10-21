#!/bin/sh

nohup java -jar -Dspring.config.location=/usr/local/lib/ /usr/local/lib/demo.jar  > /dev/stdout  2>&1 &
/usr/sbin/crond -f -l 8 && tail -f /var/log/cron.log
