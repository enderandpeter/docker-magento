#/bin/env bash

if set-permissions.sh; then
  echo "File permissions set!"
else
  echo "File permissions NOT set!"

if bin/magento cron:install; then
  echo "Cron jobs started!"
else
  echo "Cron jobs NOT started!"

php-fpm
