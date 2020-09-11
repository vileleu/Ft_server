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

unzip localhost.zip
mv localhost /var/www/
rm localhost.zip
cd

#Initialisaton de la base de donnees

service mysql start
mysql -u root < ../var/www/localhost/wordpress/init_db.sql

#Mise en place du protocole SSL

mv mkcert-v1.1.2-linux-amd64 mkcert
./mkcert -install
./mkcert localhost

#Droits et permissions des utilisateurs

chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

#demarre les services du serveur

service mysql restart
service nginx start
service php7.3-fpm start