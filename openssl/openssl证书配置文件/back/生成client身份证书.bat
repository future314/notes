openssl genrsa -out client.key 2048
openssl req -new -utf8 -sha256 -out client.csr -key client.key -config client.cfg -subj "/C=CN/ST=beijing/L=beijing/O=huawei/OU=huawei/CN=client"
openssl x509 -req -days 365 -CA ca.crt -CAkey ca.key -CAcreateserial -in client.csr -out client.crt -extensions req_ext -extfile client.cfg 


