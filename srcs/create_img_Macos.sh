docker build -t vivi .././
docker run -it --name cont -p 80:80 -p 443:443 vivi