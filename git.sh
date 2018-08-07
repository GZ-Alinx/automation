#!/bin/bash

#git action

#安装git工具（install git tool）
yum install -y git

git init /data

git add file

git commit -m".."

git config --global user.email "admin@example.com"
git config --global user.naem "admin"

git remote add origin https://github.com/GZ-Alinx/automation

move github:
git remote rm origin https://github.com/GZ-Alinx/automation

git push -u origin master And  git push origin master



End
#!/bin/bash

#git action

#安装git工具（install git tool）
yum install -y git

#初始化仓库
git init /data

#添加一个文件
git add file

#交到本地仓库
git commit -m".."

#添加全局参数
git config --global user.email "admin@example.com"
git config --global user.naem "admin"

#添加对接的远程仓库地址（https使用账号登录  ssh 使用公钥对接）
git remote add origin https://github.com/GZ-Alinx/automation

#移除远程仓库（一个git只能对接一个仓库）
move github:
git remote rm origin https://github.com/GZ-Alinx/automation

#同步本地文件到远程仓库
git push -u origin master And  git push origin master


End
