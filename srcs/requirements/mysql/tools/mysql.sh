mkdir -p /auth_pam_tool_dir/auth_pam_tool
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

/usr/bin/mysqld --user=mysql --bootstrap << ESQL
use mysql;
flush privileges;

alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';
flush privileges;

create database $MYSQL_DATABASE;
create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';
grant all privileges on $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';

flush privileges;
ESQL

echo "Hello MySQL"

/usr/bin/mysqld --user=mysql --console	
#/usr/bin/mysqld --user=mysql &
