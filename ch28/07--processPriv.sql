####
#进程查看权限 PROCESS
###
#使用 z1@localhost 登陆
mysql -uz1

#授予 z1@localhost PROCESS 进程权限
GRANT PROCESS ON *.* TO z1@localhost;

#锁定用户表 mysql.user ,阻塞进程
LOCK TABLE mysql.user READ;

#另开 root 会话
#修改密码
SET password=PASSWORD('123');

#新打开 z1 会话
#查看进程状态
#——》 清楚看到 root 会话修改密码的操作
SHOW PROCESSLIST;