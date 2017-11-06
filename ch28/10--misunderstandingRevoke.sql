####
#REVOKE 授权权限的误区
###
#创建用户 z1
DROP USER z1@localhost;
GRANT SELECT,INSERT ON test.* TO z1@localhost;

#第二次授权
GRANT ALL PRIVILEGES ON *.* TO z1@localhost;

SHOW GRANTS FOR z1@localhost;

#收回全局权限
REVOKE ALL PRIVILEGES ON *.* FROM z1@localhost;

#再次查看
SHOW GRANTS FOR z1@localhost;