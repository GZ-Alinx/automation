
#Ansible Centos7.2环境 安装文档 


#!/bin/bash

#source /etc/profile	
if [ -d /ansible ] then
	echo "文件已存在"
	else	
	mkidr -p /ansible
	fi
	
	cd /absible
	#下载python安装包
	wget http://www.python.org/ftp/python/3.6.5/Python-3.6.5.tar.xz
	#解压到指定目录
	tar xf Python-3.6.5.tar.xz -C /usr/local/
	cd /usr/local/Python-3.6.5/
	
	#预编译安装依赖包
	yum install -y zlib* lib*
	./configure --prefix=/usr/local --with-ensurepip=install --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"

	#编译安装
	make && make altinstall
	
	#将pip3.6命令软连接成pip
	ln -sv /usr/local/bin/pip3.6 /usr/local/bin/pip

	#安装py env实例
	pip install virtualenv

	#创建deploy用户并进入
	useradd deploy
	su - deploy
	source ~/.profile
	
	#使用env示例来继承Ansible2.5版本
	virtualenv -p /usr/local/bin/python3.6 .py3-a2.5-env

	#使用GIT来克隆ansible2.5源码来进行安装
	git clone https://github.com/ansible/ansible.git
	
	#完了之后我们去加载virtualenv环境
	source /home/deploy/.py3-a3-a2.5-env/bin/activate
	
	#安装Ansible依赖包
	pip install paramiko PyYAML jinja2
	
	#接下来我需要把刚才下载的Ansible源码移动到我们的Python虚拟环境下
	mv ansible .py3-a2.5-env/
	
	#接下来进入python3.6环境下的Ansible源码目录
	cd .py3-a2.5-env/ansible/
	
	#加载Ansible2.5版本
	source /home/deploy/.py3-a2.5-env/ansible/hacking/env-setup -q
	
	#验证安装是否成功
	ansible --version
	
	
	
