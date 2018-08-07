#!/bin/bash

这里安装的是Omnibus Gitlab-ce package 一键安装包

1、安装Gitlab基础环境：

关闭防火墙/守护进程
[root@localhost ~]#systemctl stop firewalld
[root@localhost ~]#systemctl disable firewalld
[root@localhost ~]#vi /etc/sysconfig/selinux
[root@localhost ~]#setenforce 0
[root@localhost ~]#vi /etc/sysconfig/selinux
[root@localhost ~]#reboot

验证是否被禁止
[root@localhost ~]#getenforce


启动postfix邮件服务
[root@localhost ~]#systemctl start postfix && systemctl enable postfix


安装gitlab的依赖包
[root@localhost ~]#yum install -y curl policycoreutils openssh-server openssh-clients postfix
 
下载gitlab仓库源
[root@localhost ~]#curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash





2、安装gitlab-ce社区版本

[root@localhost ~]#yum -y install gitlab-ce

初始化Gitlab相关服务并完成安装
[root@dongli ssl]#gitlab-ctl reconfigure


使用自动化部署工具来一键安装我们的gitlab-ce版本

接下来找到Nginx的代理工具来更改相关配置

[root@dongli ssl]#vim /var/opt/gitlab/nginx/conf/gitlab-http.conf

	server {
	  listen *:80;
	  server_name 47.147.106.113.221;
	  server_tokens off;
	  ...
	}

重新启动 等待是几分钟后即可启动访问到gitlab-ce 版本
[root@dongli ssl]# gitlab-ctl restart



浏览器输入地址即可访问：http://47.106.113.221

后期根据需求加上域名

改密码后的登录 
默认用户： root

首次登录有更新密码的操作；
