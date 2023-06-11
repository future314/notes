openssl genrsa -out server.key 2048
openssl req -new -utf8 -sha256 -out server.csr -key server.key -config server.cfg -subj "/C=CN/ST=beijing/L=beijing/O=huawei/OU=huawei/CN=server"
openssl x509 -req -days 732 -CA ca.crt -CAkey ca.key -CAcreateserial -in server.csr -out server.crt -extensions req_ext -extfile server.cfg
openssl pkcs12 -export -passout pass:future@123 -out server.pfx -inkey server.key -passin pass:future@123 -in server.crt

keytool -importkeystore -srckeystore server.pfx -srcstorepass future@123 -srcstoretype pkcs12 -destkeystore server.jks -deststorepass future@123 -deststoretype jks

#keytool -import -v -alias server -file server.crt -keystore server.jks -storepass future@123 -noprompt 

keytool -import -v -alias ca -file ca.crt -keystore server.jks -storepass future@123 -noprompt

openssl ca -gencrl -out client.crl -cert ca.crt -keyfile ca.key -config ca.cfg