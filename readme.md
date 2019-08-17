# Magento v2 Docker Deployment

## Instructions

Copy the `.env.example` to `.env` and edit it for the environment:

* `COMPOSE_PROJECT_NAME` - The project name. This value will be appended to all of the container and volume names for the deployment.
* `COMPOSE_FILE` - A colon-delimited list of `yml` files to be used for the deployment. For example, if this value were set to `file1.yml:file2.yml`, it will be like invoking `docker-compose -f file1.yml -f file2.yml`.
* `IMAGE_NS` - The prefix for the image names
* `HTTPD_PORT_80` - The host port for the httpd container's port 80
* `HTTPD_PORT_443` - The host port for the httpd container's port 443
* `DB_PORT` - The host and container port for the mysql container
* `SERVER_NAME` - The website's servername
* `MAGENTO_VOLUME` - Either an absolute path for a bind-mounted volume or the name of a docker volume
* `PHP_PORT` - The host and container port that php-fpm will listen on
* `DEPLOY_USER` - The user that the web app commands will run under
* `WORKDIR` - The root directory of the web application

Copy the `.yml.example` to a `.yml`, edit it for the environment and then add it to the deployment by editing

## The Services

## httpd

This is the web server that the site will be running from. Just be sure to create a `httpd/ssl/ssl-cert-snakeoil.pem` file that contains the SSL private key followed by the cert data.

### php

The magento site will be either bind-mounted to this container or deployed via script into a docker volume.

Add `.ini` files to the `php/ini` folder to have them copied to the php container.

### mysql

The database container. You can create a `mysql/conf.d/my.cnf` file to change settings, such as running the DB on a different port:

```
[client]
port = 3009

[mysqld]
port = 3009
```
# Deploying

Once everything is ready simply run

    docker-compose up -d

Then go into the php container and run:

    set-permissions.sh
    bin/magento setup:install \
    --base-url=https://magento.local \
    --db-host=magento_db:3309 \
    --db-name=magento \
    --db-user=magento \
    --db-password=magento \
    --backend-frontname=admin \
    --admin-firstname=Spencer \
    --admin-lastname=Williams \
    --admin-email=enderandpeter@yahoo.com \
    --admin-user=admin \
    --admin-password=admin123 \
    --language=en_US \
    --currency=USD \
    --timezone=America/Denver \
    --use-rewrites=1

Replace the above arguments with values that are appropriate for the environment.
