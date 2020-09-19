FROM	debian:buster

COPY	srcs/mkcert-v1.1.2-linux-amd64 /root/./
COPY	srcs/default root/./
COPY	srcs/html.zip ./
COPY	srcs/index_on.sh ./
COPY	srcs/index_off.sh ./
COPY	srcs/init_container.sh ./

RUN		sh init_container.sh

#demarre les services du serveur

CMD		service nginx start \
		&& service mysql restart \
		&& service php7.3-fpm start \
		&& bash