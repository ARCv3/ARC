openssl rand -base64 756 > ./keys/mongo.keyfile
chmod 400 ./keys/mongo.keyfile
openssl genrsa > ./keys/privkey.pem
openssl req -new -x509 -key ./keys/privkey.pem > ./keys/fullchain.pem