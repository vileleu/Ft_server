FROM	debian:buster

COPY	srcs/mkcert-v1.1.2-linux-amd64 /root/./
COPY	srcs/default root/./
COPY	srcs/localhost.zip ./
COPY	srcs/init_container.sh ./

RUN		sh init_container.sh