# Installing MAMP with Homebrew

## MySQL

<http://ratvars.com/operating-systems/mac/how-to-install-apache-php-and-mysql-stack-on-macos-lion/>

	brew install mysql
	unset TMPDIR
	mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

### Commands

	mysql.server start
	mysql.server stop

	mysql_secure_installation

### Preparing socket for PHP

	sudo mkdir /var/mysql
	sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock

## PHP

<https://github.com/josegonzalez/homebrew-php>

	brew tap josegonzalez/homebrew-php
	brew install php54 --with-mysql

## Apache

Remember your backup http.conf file

	sudo ln -sf /Users/thomasjbradley/Dropbox/Preferences/MAMP/httpd.conf /etc/apache2/httpd.conf

### PHP module

	LoadModule php5_module /usr/local/Cellar/php54/5.4.3/libexec/apache2/libphp5.so

### Commands

	sudo apachectl start
	sudo apachectl stop