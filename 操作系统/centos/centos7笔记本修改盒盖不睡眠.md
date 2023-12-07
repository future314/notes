配置文件： /etc/systemd/logind.conf

```
HandlePowerKey 按下电源键后的行为，默认power off
HandleSleepKey 按下挂起键后的行为，默认suspend
HandleHibernateKey 按下休眠键后的行为，默认hibernate
HandleLidSwitch 合上笔记本盖后的行为，默认suspend
```

把HandleLidSwitch后面的suspend修改为lock，可选项为

```
ignore 忽略，跳过
power off 关机
eboot 重启
halt 挂起
hibernate 让笔记本进入休眠状态
hybrid-sleep 混合睡眠，主要是为台式机设计
lock 仅锁屏，计算机继续工作
```

systemctl restart systemd-logind使配置生效

[CentOS7设置笔记本合盖不休眠 | 《Linux就该这么学》 (linuxprobe.com)](https://www.linuxprobe.com/centos7-closing-does-not-sleep.html)