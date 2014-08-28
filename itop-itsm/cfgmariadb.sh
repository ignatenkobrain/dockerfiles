#!/bin/bash -x
/usr/libexec/mariadb-prepare-db-dir mariadb
/usr/bin/mysqld_safe --basedir="/usr" &
sleep 5
/usr/bin/mysqladmin -u root password 'root123'
/usr/bin/mysql -u root -proot123 -e "CREATE DATABASE iTop;"
/usr/bin/mysql -u root -proot123 -e "CREATE USER 'iTop'@'localhost' IDENTIFIED BY 'iTopsql';"
/usr/bin/mysql -u root -proot123 -e "GRANT ALL PRIVILEGES ON iTop.* TO 'iTop'@'localhost';"
/usr/bin/mysql -u root -proot123 -e "FLUSH PRIVILEGES;"
pkill -f mysqld
