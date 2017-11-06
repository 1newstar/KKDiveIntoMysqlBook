####
#完整的备份与恢复例子
###
#创建数据库 test
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

#创建表 emp
DROP TABLE IF EXISTS emp;
CREATE TABLE emp(
	id INT,
	name VARCHAR(40),
	PRIMARY KEY(id)
) ENGINE=MyISAM;

SELECT * FROM emp;

#备份数据库 test
mysqldump -uroot -p -l -F test > test.dmp

#插入新的数据
INSERT INTO emp VALUES(5,'z5');
INSERT INTO emp VALUES(6,'z6');

#因故障需要恢复备份
mysql -uroot -p test < test.dmp

#恢复后首次查询
SELECT * FROM emp;

#使用 mysqlbinlog 恢复上次备份以来的所有 BINLOG 中数据
mysqlbinlog DESKTOP-6POJJMP-bin.000002 | mysql -uroot -p test

#完整恢复后查询
SELECT * FROM emp;