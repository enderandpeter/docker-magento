#/bin/env bash

STATICDIR=$WORKDIR/pub/static
MEDIADIR=$WORKDIR/pub/media
ETCDIR=$WORKDIR/app/etc
BINMAGENTO=$WORKDIR/bin/magento
VARDIR=$WORKDIR/var
GENERATEDDIR=$WORKDIR/generated
VENDORDIR=$WORKDIR/vendor

if [ -d "$STATICDIR" ] && [ -d "$MEDIADIR" ] && [ -d "$ETCDIR" ]; then
  echo "Setting owernship for Magento site files..."
  echo "find "$VARDIR" "$GENERATEDDIR" "$VENDORDIR" "$STATICDIR" "$MEDIADIR" "$ETCDIR" -exec chown $DEPLOY_USER {} +" | su - $DEPLOY_USER --shell=/bin/bash
  echo "Setting permissions for Magento site files..."
  echo "find "$VARDIR" "$GENERATEDDIR" "$VENDORDIR" "$STATICDIR" "$MEDIADIR" "$ETCDIR" -type f -exec chmod u+w {} +" | su - $DEPLOY_USER --shell=/bin/bash
  echo "Setting permissions for Magento site directories..."
  echo "find "$VARDIR" "$GENERATEDDIR" "$VENDORDIR" "$STATICDIR" "$MEDIADIR" "$ETCDIR" -type d -exec chmod u+w {} +" | su - $DEPLOY_USER --shell=/bin/bash
else
  echo "Magento directories not found in $WORKDIR"
fi

if [ -f "$BINMAGENTO" ]; then
  echo "Making sure bin/magento is executable..."
  echo "cd "$WORKDIR" && chmod u+x "$BINMAGENTO"" | su - $DEPLOY_USER --shell=/bin/bash
else
  echo "Could not find ${WORKDIR}$BINMAGENTO"
fi
