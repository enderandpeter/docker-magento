FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD=root \
    MYSQL_DATABASE=magento \
    MYSQL_USER=magento \
    MYSQL_PASSWORD=magento \
    TERM=xterm

RUN apt-get update && apt-get install --yes \
vim

COPY conf.d/* /etc/mysql/conf.d/

VOLUME ["/var/lib/mysql"]
