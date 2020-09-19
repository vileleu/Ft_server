#Installation et mise a jour des packages

apt-get update
apt-get -y install nginx
apt-get -y install mariadb-server mariadb-client
apt-get -y install php php-fpm php-mysql php-cli php-cgi php-mbstring
apt-get install -y openssl
apt-get -y install zip
apt-get purge -y apache2

#Configurer Nginx

cd && cd ../
mv root/default /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

#Installer phpmyadmin && wordpress

unzip html.zip
mv html/* /var/www/html
rm -rf html.zip
rm -rf html
mv var/www/html/index.nginx-debian.html var/www/html/index.nginx-debian.txt
cd

#Initialisaton de la base de donnees

service mysql start
mysql -u root < ../var/www/html/wordpress/init_db.sql

#Mise en place du protocole SSL

mv mkcert-v1.1.2-linux-amd64 mkcert
./mkcert -install
./mkcert localhost

#Droits et permissions des utilisateurs

chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*