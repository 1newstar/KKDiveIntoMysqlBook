####
#超级管理员权限 SUPER
###
#登录 z1@localhost
mysql -uz1

#查看继承列表
SHOW PROCESSLIST;

#尝试杀死 root 进程
#——》失败，因无 SUPER 权限
kill 69;

#赋予 z1 超级管理员权限 SUPER
GRANT SUPER ON *.* TO z1@localhost;

#查看 z1 权限
SHOW GRANTS FOR z1@localhost;

#再次尝试杀死 root 进程
#——》成功杀死 root 用户的进程
kill 69;