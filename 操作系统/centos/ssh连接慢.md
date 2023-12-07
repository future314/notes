### 问题1：centos7 连接ssh很慢

### 原因：

​	ssh服务开启了反向dns解析，本质原因是网络配置的dns114.114.114.114延迟很高。

#### 解决方案：ssh服务关闭DNS反向解析

​	# vi /etc/ssh/sshd_config

​		UseDNS=no

### 问题2：ping 域名很慢,但是延迟不高，ping ip是正常的。

#### 原因：

​	网络配置设置的域名解析服务器延迟过高

#### 解决方案：

​	修改DNS配置

​	vim /etc/sysconfig/network-scripts/ifcfg-p4p2

​	![image-20230307181123680](img/ssh连接慢-img/image-20230307181123680.png)



[(126条消息) CentOS/Linux 解决 SSH 连接慢_doiido的博客-CSDN博客](https://blog.csdn.net/doiido/article/details/43793391)

[(126条消息) DNS反向解析导致SSH登录很慢_dns引起rsh慢_格一物的博客-CSDN博客](https://blog.csdn.net/ory001/article/details/108258666)