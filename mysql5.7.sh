#!/bin/bash

一、下载通用安装二进制包

     先下载mysql安装包： 打开 http://dev.mysql.com/downloads/mysql
     下载社区版本：
     wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.12-linux-glibc2.12-x86_64.tar.xz
     wget https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.23-linux-glibc2.12-x86_64.tar.gz

     选择linux-Generic并在其下选择
     Linux - Generic (glibc 2.5) (x86, 64-bit), Compressed TAR Archive


二、创建用户并授权

    用户/组创建：
    groupadd mysql
    useradd -g mysql mysql

    解压包：
    tar -zxf mysql-5.7.22-linux-glibc2.12-x86_64.tar.gz -C /usr/local/
    mv mysql-5.7.22-linux-glibc2.12-x86_64 mysql && cd $!

    创建数据目录：
    cd bin/

    查看库文件，是否有支持的，如果没有就提前安装
    ldd mysqld


	解决Mysql报错缺少libaio.so.1

        64位系统安装：
        wget http://mirror.centos.org/centos/6/os/x86_64/Packages/libaio-0.3.107-10.el6.x86_64.rpm
        rpm -ivh libaio-0.3.107-10.el6.x86_64.rpm
        
	32位系统现在很少了，yum似乎默认安装32位的：
        yum install libaio.so.1
	
三、数据目录
	mkdir -p /data/mysql/mysql3306/{data,logs,tmp}
	cd !$
	chown -R mysql.mysql /data/mysql/mysql3306/\
	#这里的my3306.cnf 文件需要自己下载或者生成

四、初始化数据库
	/usr/local/mysql/bin/mysqld   --defaults-file=/data/mysql/mysql3306/my3306.cnf     --initialize
	cat    /data/mysql/mysql3306/data/error.log
	#默认数据库密码
	cat    /data/mysql/mysql3306/data/error.log |grep     -i    "error"

	#添加mysql命令到配置文件
	echo      "export    PATH=$PATH:/usr/local/mysql/bin"    >>  /etc/profile
	source    /etc/profile
	

数据库管理命令集合：

	启动数据库：
	/usr/local/mysql/bin/mysqld   --defaults-file=/data/mysql/mysql3306/my3306.cnf    &
	进入数据库：
	mysql     -S     /tmp/mysql3306.sock   -p
	报错了就用绝对路径：/usr/local/mysql/bin/mysql  -S     /tmp/mysql3306.sock       -p

	进入数据库首次需要更新密码否则执行不了命令：
	alter  user  user()   identified   by  'gslixiong';
	flush privileges;

	修改密码：
        update user set authentication_string=password('新密码') where user='root' and host='localhost';
	
	启动与停止
        启动：    /usr/local/mysql/bin/mysqld    --defaults-file=/data/mysql/mysql3306/my3306.cnf     &  
        进入：    /usr/local/mysql/bin/mysql    -S    /tmp/mysql3306.sock   -p     
        关闭：    /usr/local/mysql/bin/mysqld    -S   /tmp/mysql3306.sock    shutdown    
