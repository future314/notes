1. 安装 NetworkManager-wifi

   *yum* -y install NetworkManager-wifi

   安装完成后，默认开启和开机自启。
   但是使用之前需要重启 NetworkManager-wifi 才能生效。

2. 搜索 WiFi

   *nmcli* dev wifi list

3. 连接 WiFi

   nmcli dev wifi connect "WiFi 名称" password "WiFi 密码"

在开始使用时遇到了报错

Unable to connect to any wifi with NetworkManager due to error: Secrets were required, but not provided![image-20230310004128570](img/NetworkManager-wifi连接wifi-img/image-20230310004128570.png)

后面重启电脑解决了问题，可能是只需要重启 NetworkManager-wifi服务就能生效。

[(126条消息) CentOS 7 最小化安装 自动连接 WiFi_centos7 wifi_徐晓伟的博客-CSDN博客](https://blog.csdn.net/qq_32596527/article/details/93230855)

nmcli dev wifi connect CMCC-ECMq password nxdhzv6k