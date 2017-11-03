####
#行锁实现方式--依赖于索引查询
#   如果不能索引查询，则会锁住全部记录，等价于锁表
###


#创建表 tab_no_index
DROP TABLE IF EXISTS tab_no_index;
CREATE TABLE tab_no_index(
	id INT,
	name VARCHAR(10)
) ENGINE=InnoDB;

#查询全部
SELECT * FROM tab_no_index;

#插入测试数据
INSERT INTO tab_no_index
	VALUES(1,'1'),(2,'2'),(3,'3'),(4,'4');

####
#会话 session_1 加锁导致锁住全部记录
###
#打开事务
SET AUTOCOMMIT=0;

#普通查询
SELECT * FROM tab_no_index WHERE id=1;

#给指定行加排他锁
SELECT * FROM tab_no_index
	WHERE id=1
	FOR UPDATE;

#关闭事务
SET AUTOCOMMIT=1;

####
#会话 session_2 尝试加锁其他行，但已经不行了
###
SET AUTOCOMMIT=0;
SELECT * FROM tab_no_index
	WHERE id=2
	FOR UPDATE;

#关闭事务
SET AUTOCOMMIT=1;

