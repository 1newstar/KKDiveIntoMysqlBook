####
#创建和授权账号
###
#创建用户 z1@localhost ,拥有所有库的、所有表的查询权限
GRANT SELECT ON *.* TO z1@localhost;

#查询用户 z1@localhost 的所有信息
SELECT * FROM mysql.user
	WHERE user='z1' AND host='localhost';

#查看用户 z1@localhost 对库 数据库 的权限
#——》 结果为空， 所有库都相同的权限的用户并不会记录在 mysql.db 表中
SELECT * FROM mysql.db;

#收回 z1@localhost 的权限
REVOKE SELECT ON *.* FROM z1@localhost;
#重新赋予新的权限
GRANT SELECT ON test.* TO z1@localhost;

#查询用户 z1@localhost 的所有信息
#——》无记录
SELECT * FROM mysql.user
	WHERE user='z1' AND host='localhost';

#查看用户 z1@localhost 对库 数据库 的权限
#——》有记录
SELECT * FROM mysql.db;
