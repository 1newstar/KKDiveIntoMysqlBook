####
#创建账户
###

#创建一个拥有所有数据库、所有权限的账户 zroot@localhost
GRANT ALL PRIVILEGES ON *.* TO zroot @localhost;

#——》 除 GRANT 权限外，其他都为 Y
SELECT * FROM mysql.user
	WHERE user='zroot' AND host='localhost';

#增加 zroot@localhost 的 GRANT 权限
GRANT ALL PRIVILEGES ON *.* TO zroot@localhost WITH GRANT OPTION;

#——》所有权限均为 Y
SELECT * FROM mysql.user
	WHERE user='zroot' AND host='localhost';

#设置 zroot@localhost 的密码
GRANT ALL PRIVILEGES ON *.* TO zroot@localhost IDENTIFIED BY '123456' WITH GRANT OPTION;

SELECT * FROM mysql.user
	WHERE user='zroot' AND host='localhost';

#创建用户 z2，其可以在任何 ip 登录
GRANT SELECT,INSERT,UPDATE,DELETE ON test.*
	TO 'z2'@'%' IDENTIFIED BY '123456';

SELECT * FROM mysql.user
	WHERE user='z2';

SELECT * FROM mysql.db;

#创建拥有管理权限的 z3@%
#管理权限不能指定给具体库和表，因此只能使用 *.*
GRANT SUPER,PROCESS,FILE ON *.* TO 'z3'@'%';

#创建只有登录权限的 z4@localhost
GRANT USAGE ON *.* TO z4@localhost;

#直接操作权限表 mysql.db 修改用户 z2@% 的权限
INSERT INTO mysql.db(host,db,user,select_priv,insert_priv,update_priv,delete_priv)
	VALUES('%','test','z2','Y','Y','Y','Y');

#刷新权限
FLUSH PRIVILEGES;

