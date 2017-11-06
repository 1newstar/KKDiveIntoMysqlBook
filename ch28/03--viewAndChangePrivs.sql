####
#查看和修改账户权限
###
#查看某账户的所有权限
SHOW GRANTS FOR z1@localhost;

#使用系统表 information_schema.SCHEMA_PRIVILEGES 查看权限
SELECT * FROM information_schema.SCHEMA_PRIVILEGES
	WHERE grantee="'z1'@'localhost'";

#创建 z5@localhost
GRANT USAGE ON *.* TO z5@localhost;

SHOW GRANTS FOR z5@localhost;

#修改 z5@localhost 的权限：增加对所有库、所有表的 SELECT 权限
GRANT SELECT ON *.* TO z5@localhost;

#继续修改 z5@localhost 的权限：增加对所有库、所有表的 INSERT 权限
GRANT SELECT,INSERT ON *.* TO z5@localhost;

#收回 z5@localhost 的 INSERT 和 SELECT 权限
REVOKE INSERT,SELECT ON *.* FROM z5@localhost;

#REVOKE 无法回收 USAGE 权限
REVOKE USAGE ON *.* FROM z5@localhost;

