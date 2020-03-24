FROM amazonlinux:2018.03

RUN yum -y update

RUN yum -y install \
    nginx \
    php54-fpm \
    php54-common \
    php54-gd \
    php54-pdo \
    php54-xml \
    php54-odbc \
    php54-intl \
    php54-snmp \
    php54-mcrypt \
    php54-mysqlnd \
    php54-mbstring \
    php54-pecl-memcache \
    telnet \
    aws-cli \
    php54-bcmath \
    php54-pecl-imagick

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/6/remi/x86_64/remi-release-6.10-1.el6.remi.noarch.rpm

RUN yum --enablerepo=remi -y install php54-php-pecl-mongo php54-php-soap
RUN yum -y install git

RUN echo 'extension=/opt/remi/php54/root/usr/lib64/php/modules/mongo.so' >> /etc/php.d/mongo.ini
RUN echo 'extension=/opt/remi/php54/root/usr/lib64/php/modules/soap.so' >> /etc/php.d/soap.ini

RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/bin/ && composer self-update

ADD resources /tmp

RUN chmod +x /tmp/configservices.sh
RUN chmod +x /tmp/runservices.sh
RUN /tmp/configservices.sh

EXPOSE 80
WORKDIR /app/
ENTRYPOINT /tmp/runservices.sh