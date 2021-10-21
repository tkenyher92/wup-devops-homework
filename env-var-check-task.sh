#!/bin/sh
if [[ -z "${APP_VARIABLE}" ]]; then
  echo "$(date) [CRON]: APP_VARIABLE is not set!" >> /dev/stderr
else
  echo "$(date) [CRON]: APP_VARIABLE is set to '${APP_VARIABLE}'" >> /dev/stdout
fi
