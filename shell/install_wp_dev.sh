#!/bin/bash

set -e

echo "======================================"
echo " WordPress Auto Installer (Debian 12)"
echo "======================================"

if [ "$(id -u)" != "0" ]; then
echo "请使用 root 用户执行"
exit 1
fi

read -s -p "请输入 WordPress 数据库密码: " DB_PASS
echo

DB_NAME="wordpress"
DB_USER="wpuser"
WEBROOT="/var/www/wordpress"

echo "开始安装..."

apt update
apt upgrade -y

apt install -y 
nginx 
mariadb-server 
php-fpm 
php-mysql 
php-cli 
php-curl 
php-gd 
php-mbstring 
php-xml 
php-zip 
php-intl 
php-imagick 
wget 
curl 
unzip

systemctl enable nginx
systemctl enable mariadb
systemctl enable php8.2-fpm

systemctl restart nginx
systemctl restart mariadb
systemctl restart php8.2-fpm

echo "配置数据库..."

mysql <<EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME}
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost'
IDENTIFIED BY '${DB_PASS}';

GRANT ALL PRIVILEGES
ON ${DB_NAME}.*
TO '${DB_USER}'@'localhost';

FLUSH PRIVILEGES;
EOF

echo "下载 WordPress..."

rm -rf ${WEBROOT}
mkdir -p ${WEBROOT}

cd /tmp

wget -O wordpress.tar.gz https://wordpress.org/latest.tar.gz

tar -xzf wordpress.tar.gz

cp -r wordpress/* ${WEBROOT}

chown -R www-data:www-data ${WEBROOT}

find ${WEBROOT} -type d -exec chmod 755 {} ;
find ${WEBROOT} -type f -exec chmod 644 {} ;

cd ${WEBROOT}

cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/${DB_NAME}/" wp-config.php
sed -i "s/username_here/${DB_USER}/" wp-config.php
sed -i "s/password_here/${DB_PASS}/" wp-config.php

PHP_SOCK=$(find /run/php -name "php*-fpm.sock" | head -n1)

echo "配置 Nginx..."

cat > /etc/nginx/sites-available/default <<EOF
server {
listen 80 default_server;
listen [::]:80 default_server;

```
server_name _;

root ${WEBROOT};
index index.php index.html;

location / {
    try_files \$uri \$uri/ /index.php?\$args;
}

location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:${PHP_SOCK};
}

location ~ /\.ht {
    deny all;
}
```

}
EOF

nginx -t

systemctl reload nginx

SERVER_IP=$(hostname -I | awk '{print $1}')

echo
echo "======================================"
echo "安装完成"
echo "======================================"
echo
echo "WordPress目录:"
echo "${WEBROOT}"
echo
echo "数据库:"
echo "DB_NAME=${DB_NAME}"
echo "DB_USER=${DB_USER}"
echo
echo "访问地址:"
echo "http://${SERVER_IP}"
echo
echo "接下来完成 WordPress 初始化安装即可。"
echo
