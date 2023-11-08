配置http代理  
- git config --global http.proxy 127.0.0.1:7890
- git config --global https.proxy 127.0.0.1:7890

查看代理
- git config --global --get http.proxy
- git config --global --get https.proxy

取消代理
- git config --global --unset http.proxy
- git config --global --unset https.proxy

解除ssl验证(解决报错OpenSSL SSL_read: Connection was reset, errno 10054)
- git config --global http.sslVerify "false" 