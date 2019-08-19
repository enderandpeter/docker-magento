#/bin/env bash

if set-permissions.sh; then
  echo "File permissions set!"
else
  echo "File permissions NOT set!"
fi

echo "Starting cron jobs..."
if "$WORKDIR"/bin/magento cron:install; then
  echo "Cron jobs started!"
else
  echo "Cron jobs NOT started!"
fi

#docker-php-entrypoint
