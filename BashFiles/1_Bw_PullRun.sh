sudo docker pull bitwardenrs/server
sudo docker run \
    --restart always \
    --name Bitwarden \
    --mount type=bind,source=/home/pi/Bitwarden/bw-data,target=/data \
    --mount type=bind,source=/etc/ssl/certs,target=/ssl \
    -e ROCKET_TLS='{certs="/ssl/bitwarden.crt",key="/ssl/bitwarden.key"}' \
    -p 8080:80 \
    -d bitwardenrs/server