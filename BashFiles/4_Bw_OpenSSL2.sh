# Create a text file bitwarden.ext with the following content, change the domain names to your setup.
# authorityKeyIdentifier=keyid,issuer
# basicConstraints=CA:FALSE
# keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
# extendedKeyUsage = serverAuth
# subjectAltName = @alt_names

# [alt_names]
# IP.1 = 192.168.1.40 <<<<<<<<<<<<<<<<<<<-------------------- SELECT THIS ONE --------------------
# DNS.1 = bitwarden.local
# DNS.2 = www.bitwarden.local

# Create the bitwarden certificate, signed from the root CA
sudo openssl x509 -req -in bitwarden.csr -CA self-signed-ca-cert.crt -CAkey private-ca.key -CAcreateserial -out bitwarden.crt -days 365 -sha256 -extfile bitwarden.ext

# NB: As of April 2019 iOS 13+ and macOS 15+, the server certificate can not have an expiry > 825 and must include ExtendedKeyUsage extension 
# https://support.apple.com/en-us/HT210176

# Add the root certificate and the bitwarden certificate to client computers.

# move the certificates to the proper location:
sudo mv bitwarden.crt bitwarden.key /etc/ssl/certs
