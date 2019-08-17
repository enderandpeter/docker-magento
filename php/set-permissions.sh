#/bin/env bash

STATICDIR=pub/static
MEDIADIR=pub/media
ETCDIR=app/etc
BINMAGENTO=bin/magento

su - $DEPLOY_USER --shell=/bin/bash

cd $WORKDIR

if [ -d "$STATICDIR" ] && [ -d "$MEDIADIR" ] && [ -d "$ETCDIR" ]; then
  find var generated vendor "$STATICDIR" "$MEDIADIR" "$ETCDIR" -type f -exec chmod u+w {} +
  find var generated vendor "$STATICDIR" "$MEDIADIR" "$ETCDIR" -type d -exec chmod u+w {} +
else
  echo "Magento directories not found in $WORKDIR"
fi

if [ -f "$BINMAGENTO" ]; then
  chmod u+x "$BINMAGENTO"
else
  echo "Could not find $BINMAGENTO"
fi

exit
