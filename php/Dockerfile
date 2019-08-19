FROM php:7.2-fpm

ARG DEPLOY_USER_HOME
ARG DEPLOY_USER
ARG WORKDIR

COPY *.sh /usr/local/bin/

COPY ini/ /throwaway/
RUN cp /throwaway/*.ini $PHP_INI_DIR/conf.d/ && \
rm -Rf /throwaway/ && \
chmod +x /usr/local/bin/*.sh && \
apt-get update && apt-get install --yes wget unzip vim libzip-dev libpng-dev libjpeg-dev \
libfreetype6-dev libxml2-dev libxslt-dev cron && \
docker-php-ext-configure gd --with-jpeg-dir --with-freetype-dir && \
docker-php-ext-install -j$(nproc) zip gd soap xsl pdo_mysql bcmath intl && \
useradd --home $DEPLOY_USER_HOME --create-home --shell /bin/false --groups www-data $DEPLOY_USER && \
install-composer.sh

WORKDIR "$WORKDIR"

#ENTRYPOINT ["start.sh"]
