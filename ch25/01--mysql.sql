####
#客户端连接工具
###
#查看当前用户
SELECT CURRENT_USER();

#登录远程 MySQL 服务器
mysql -h 192.168.7.55 -P 3306 -uroot -p

#查看字符集
SHOW VARIABLES LIKE 'chara%';

#连接时指定字符集
mysql -uroot --default-character-set=utf8

#不连接直接执行多个 SQL
mysql -uroot -p -e "SELECT first_name,last_name FROM actor WHERE first_name LIKE '%k';SELECT COUNT(*) FROM actor" sakila

#垂直格式化显示
mysql -uroot -p mysql -e "SELECT User,Host FROM user" -E

#创建测试表 t2
DROP TABLE IF EXISTS t2;
CREATE TABLE t2(id INT);

#查询全部 t2
SELECT * FROM t2;

#a.sql 内容
INSERT INTO t2 VALUES(1);
INSERT INTO t2 VALUES(2a);
INSERT INTO t2 VALUES(3);