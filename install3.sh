#!/bin/bash

# CREATE A SWAPFILE FOR NGINX COMPILATION
sudo dd if=/dev/zero of=/swapfile bs=1024 count=2048k
sudo mkswap /swapfile
sudo swapon /swapfile

# INSTALL PASSENGER + NGINX
rvmsudo gem install passenger --no-rdoc --no-ri
passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx --languages ruby,python,nodejs,meteor

# DEFAULT RUBY APP SECRET KEY BASE
sudo echo "" >> /etc/bash.bashrc
sudo echo "# DEFAULT RUBY APP SECRET_KEY_BASE" >> /etc/bash.bashrc
sudo echo 'export SECRET_KEY_BASE=eae2d4b09d90966e214853ffeecdab45b024293e541a9de58b4e63f0f167bd42f26c324869bf5283034f2b399ace7fbab5eb434ec28c54bb1d7832cbac9d054c' >> /etc/bash.bashrc
export SECRET_KEY_BASE=eae2d4b09d90966e214853ffeecdab45b024293e541a9de58b4e63f0f167bd42f26c324869bf5283034f2b399ace7fbab5eb434ec28c54bb1d7832cbac9d054c

# install system dependencies: ruby (done), nginx (done), node (done), passenger (done), (pureftp), (dns_stuff?), (postgres), mysql (done), (mongodb)

# default files for new users after this point
sudo cp -r misc/skeleton/. /etc/skel/

# "configure" php
# php 5.6 and 7.0
# sudo apt-get install -y php5.6-cgi php5.6-cli php5.6-phpdbg php5.6-fpm libphp5.6-embed php5.6-dev php5.6-common php5.6-curl php5.6-gd php5.6-imap php5.6-intl php5.6-ldap php5.6-mysql php5.6-pgsql php5.6-pspell php5.6-recode php5.6-snmp php5.6-sqlite3 php5.6-sybase php5.6-tidy php5.6-opcache php5.6-json php5.6-bz2 php5.6-mcrypt php5.6-odbc php5.6-readline php5.6-interbase php5.6-xmlrpc php5.6-enchant php5.6-xsl php5.6-bcmath php5.6-mbstring php5.6-soap php5.6-xml php5.6-zip php5.6-dba php7.0-bcmath php7.0-bz2 php7.0-enchant php7.0-fpm php7.0-imap php7.0-interbase php7.0-intl php7.0-mbstring php7.0-mcrypt php7.0-phpdbg php7.0-soap php7.0-sybase php7.0-xsl php7.0-zip php-amqp php-amqplib php-analog php-apigen php-apigen-theme-bootstrap php-apigen-theme-default php-assetic php-ast php-auth php-auth-http php-auth-sasl php-aws-sdk php-bcmath php-bz2 php-cache php-cache-lite php-cas php-cli-prompt php-codecoverage php-codesniffer php-compat php-composer-semver php-composer-spdx-licenses php-console-commandline php-console-table php-crypt-blowfish php-crypt-cbc php-crypt-chap php-crypt-gpg php-cssmin php-date php-db php-deepcopy php-directory-scanner php-doc php-doctrine-annotations php-doctrine-bundle php-doctrine-cache php-doctrine-cache-bundle php-doctrine-collections php-doctrine-common php-doctrine-data-fixtures php-doctrine-dbal php-doctrine-inflector php-doctrine-instantiator php-doctrine-lexer php-doctrine-orm php-dompdf php-dropbox php-elisp php-email-validator php-enchant php-fdomdocument php-file-iterator php-finder-facade php-finder-facade-doc php-font-lib php-fpdf php-fshl php-fxsl php-geoip php-geshi php-getid3 php-gettext php-gnupg php-google-api-php-client php-gmagick php-guzzle-stream php-guzzlehttp php-guzzlehttp-promises php-guzzlehttp-psr7 php-guzzlehttp-ringphp php-guzzlehttp-ringphp-doc php-hamcrest php-html-safe php-htmlawed php-htmlpurifier php-http php-http-request php-http-request2 php-http-webdav-server php-icinga php-igbinary php-image-text php-imagick php-imap php-interbase php-intl php-invoker php-irods-prods php-jmespath php-json php-json-patch php-json-schema php-jwt php-kdyby-events php-kit-pathjoin php-league-flysystem php-libvirt-php php-libsodium php-log php-lua php-mail php-mailparse php-mail-mbox php-mail-mime php-mail-mimedecode php-markdown php-mbstring php-mcrypt php-mdb2 php-mdb2-driver-mysql php-mdb2-driver-pgsql php-memcache php-memcached php-mf2 php-mime-type php-mockery php-mockery-doc php-mongo php-mongodb php-mysql php-monolog php-msgpack php-net-dime php-net-dns2 php-net-ftp php-net-imap php-net-ipv4 php-net-ipv6 php-net-ldap php-net-ldap2 php-net-ldap3 php-net-nntp php-net-publicsuffix php-net-sieve php-net-smartirc php-net-smtp php-net-socket php-net-url php-net-url2 php-net-whois php-nette php-nrk-predis php-numbers-words php-oauth php-openid php-pager php-parser php-patchwork-utf8 php-pclzip php-pdfparser php-pecl-http php-pecl-http-dev php-phpdbg php-phpdocumentor-reflection php-phpdocumentor-reflection-common php-phpdocumentor-reflection-docblock php-phpdocumentor-type-resolver php-phpseclib php-phpspec-prophecy php-picofeed php-pimple php-propro php-propro-dev php-proxy-manager php-psr-cache php-psr-http-message php-psr-log php-punic php-radius php-random-compat php-raphf php-raphf-dev php-react-promise php-readline php-redis php-rrd php-sass php-seclib php-securitylib php-sepa-direct-debit php-services-json php-services-weather php-smb php-smbclient php-soap php-solr php-sql-formatter php-ssh2 php-stomp php-streams php-superclosure php-swiftmailer php-sybase php-tcpdf php-text-captcha php-text-figlet php-text-languagedetect php-text-password php-text-template php-text-wiki php-timer php-token-stream php-tokenreflection php-twig php-twig-doc php-uuid php-validate php-webmozart-assert php-wikidiff2 php-xajax php-xcache php-xdebug php-xml php-xml-htmlsax3 php-xml-parser php-xml-rpc2 php-xml-serializer php-xml-svg php-zend-code php-zend-db php-zend-eventmanager php-zend-hydrator php-zend-search php-zend-stdlib php-zend-xml php-zeta-base php-zeta-console-tools php-zeta-unit-test php-zip php-zipstreamer php-zmq php-xhprof php-mysqlnd-ms php-phalcon
sudo apt-get install -y php7.0-fpm php7.0-mysql php5.6-fpm php5.6-mysql  # just for now
sudo cp -f misc/conf/php5.6-fpm.www.conf /etc/php/5.6/fpm/pool.d/www.conf
sudo cp -f misc/conf/php7.0-fpm.www.conf /etc/php/7.0/fpm/pool.d/www.conf
sudo systemctl restart php5.6-fpm.service
sudo systemctl restart php7.0-fpm.service

# "configure" nginx
sudo mkdir /opt/nginx/sites-available
sudo ln -s /opt/nginx/sites-available /opt/nginx/sites-enabled
sudo cp -f misc/conf/nginx.conf /opt/nginx/conf/nginx.conf
cd /opt/nginx/sites-enabled/  # here we are just making sure that if the user runs this script twice, we would not have created symlink twice thus creating error
sudo rm -f sites-available
sudo kill $(cat /opt/nginx/logs/nginx.pid)  # here we restart nginx
sudo /opt/nginx/sbin/nginx
