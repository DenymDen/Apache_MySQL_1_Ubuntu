#!/bin/bash

# Получаем имя папки, в которой находится скрипт
DB_NAME=$(basename $(dirname "$0"))

# Создаем базу данных
mysql -u root -p -e "CREATE DATABASE $DB_NAME"

# Получаем список файлов бэкапов
BACKUP_FILES=$(find . -name "*.sql")

# Восстанавливаем таблицы
for FILE in $BACKUP_FILES; do
  mysql -u root -p $DB_NAME < "$FILE"
done

echo "Восстановление базы данных $DB_NAME завершено"











# Создание баз данных
#mysql -u root -p -e "create database otus;"
#mysql -u root -p -e "create database otus1;"
#mysql -u root -p -e "create database otus2;"

# Восстановление таблиц
#mysql -u root -p otus < otus_table_1.sql
#mysql -u root -p otus < otus_table_2.sql
#mysql -u root -p otus1 < otus1_table_1.sql
#mysql -u root -p otus1 < otus1_table_2.sql
#mysql -u root -p otus2 < otus2_table_1.sql
#mysql -u root -p otus2 < otus2_table_2.sql