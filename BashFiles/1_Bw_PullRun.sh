sudo docker pull bitwardenrs/server
sudo docker run \
    --restart always \
    --name Bitwarden \
    --mount type=bind,source=/home/pi/Bitwarden/bw-data,target=/data \
    -p 8080:80 \
    -d bitwardenrs/server