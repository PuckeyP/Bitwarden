# Create a CA key (your own little on-premise Certificate Authority):
sudo openssl genpkey -algorithm RSA -aes128 -out private-ca.key -outform PEM -pkeyopt rsa_keygen_bits:2048
# Create a CA certificate:
sudo openssl req -x509 -new -nodes -sha256 -days 3650 -key private-ca.key -out self-signed-ca-cert.crt
# Create a bitwarden key:
sudo openssl genpkey -algorithm RSA -out bitwarden.key -outform PEM -pkeyopt rsa_keygen_bits:2048
# Create the bitwarden certificate request file #
sudo openssl req -new -key bitwarden.key -out bitwarden.csr
