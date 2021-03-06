####
#MERGE 表的漏洞
###
#创建 z1 ，赋予数据库 test 的所有权限
DROP USER z1@localhost;
GRANT ALL PRIVILEGES ON test.* TO z1@localhost;

SHOW GRANTS FOR z1@localhost;

#创建表 t1
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(
	id INT
) ENGINE=MyISAM;

INSERT INTO t1 VALUES(1),(1);

SELECT * FROM t1;

#创建表 t2
DROP TABLE IF EXISTS t2;
CREATE TABLE t2(
	id INT
) ENGINE=MyISAM;

INSERT INTO t2 VALUES(2);

SELECT * FROM t2;

#z1 在 t1,t2 上创建 MERGE 表 t12
DROP TABLE IF EXISTS t12;
CREATE TABLE t12(id INT)
	ENGINE=MERGE UNION=(t1,t2);

SELECT * FROM t12;


#root 收回 z1 上的权限
REVOKE ALL PRIVILEGES ON test.* FROM z1@localhost;

SHOW GRANTS FOR z1@localhost;

