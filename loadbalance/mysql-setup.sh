#!/bin/bash

dbname="testdb"
username="JP"
userpass="p455w0rd1"

mysql -e "CREATE DATABASE ${dbname} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
mysql -e "CREATE USER ${username}@localhost IDENTIFIED BY '${userpass}';"
mysql -e "GRANT ALL PRIVILEGES ON ${dbname}.* TO '${username}'@'localhost';"
exit
