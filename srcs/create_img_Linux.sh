docker build -t vivi .././
docker run -it --name cont -p 8080:8080 -p 443:443 vivi