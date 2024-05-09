# 通过域名访问ipv6主机

1. 在<https://dynv6.com/>申请免费的ipv6域名
2. 域名1：tangmi.dns.army，域名2：loyuan.dns.army
3. 使用dynv6提供的更新域名ip的接口通过shell脚本定时调用
4. 使用cron定时调用ddns脚本刷新域名ip
   - 执行crontab -e增加定时任务`*/10 * * * * token=*** sh /opt/ddns-script/dynv6.sh tangmi.dns.army >> /opt/ddns-script/ddns.log`
   - 重启cron服务`service cron restart`
  
5. 参考
   - <https://dynv6.com/>
   - <https://zhuanlan.zhihu.com/p/601713517>
