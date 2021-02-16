sudo docker pull bitwardenrs/server:latest
sudo docker run --restart always -d \
                -p 8080:80 \
                -v /Bitwarden/bw-data:/data/ \
                -v /etc/ssl/certs/:/ssl/ \
                -e ROCKET_TLS='{certs="/ssl/bitwarden.crt,key="/ssl/bitwarden.key"}' \
                bitwarden
