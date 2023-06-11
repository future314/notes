openssl genrsa -out ca.key 4096
openssl req -new -utf8 -sha256 -out ca.csr -key ca.key -config ca.cfg -subj "/C=CN/ST=beijing/L=beijing/O=huawei/OU=huawei/CN=ca"
openssl x509 -req -days 3650 -extensions v3_req -extensions v3_ca -extfile ca.cfg -in ca.csr -signkey ca.key -out ca.crt
pause