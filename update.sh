#!/bin/bash

# Копируем файл 000-default.conf
sudo cp /Apache_MySQL_1_Ubuntu/000-default.conf /etc/apache2/sites-available/000-default.conf

# Создаём папку /var/www/html/apache2
sudo mkdir /var/www/html/apache2

# Импортируем файл
sudo mv index.html /var/www/html/apache2/

# Перезапускаем Apache
sudo systemctl reload apache2

# Копируем файл mysqld.cnf
sudo cp /Apache_MySQL_1_Ubuntu/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# Перезапускаем MySQL
systemctl restart mysql

# Создаём пользователя
mysql -u root -p -e "CREATE USER repl@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'oTUSlave#2020';"

# Даём права на репликацию
mysql -u root -p -e "GRANT REPLICATION SLAVE ON *.* TO repl@'%';"