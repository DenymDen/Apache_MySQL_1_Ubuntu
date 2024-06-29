#!/bin/bash

# Создаем базу данных
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS otus;"

# Получаем список файлов в папке
FILES=$(find . -type f)

# Восстанавливаем таблицы
for FILE in $FILES; do
  if [[ $FILE =~ .*\.sql$ ]]; then
    mysql -u root -p otus < "$FILE"
  fi
done

echo "Восстановление базы данных otus завершено"











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