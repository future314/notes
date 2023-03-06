1.备份本地yum源

​	mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo_bak 

2.获取阿里yum源配置文件

​	wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo 

3.更新cache

​	yum makecache 

4.升级所有包同时也升级软件和系统内核

​	yum -y update