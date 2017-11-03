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

####
#----------------有索引的时候，就只会锁住复合条件的行了
###
#创建带索引的表 tab_with_index
DROP TABLE IF EXISTS tab_with_index;
CREATE TABLE tab_with_index LIKE tab_no_index;
ALTER TABLE tab_with_index
	ADD INDEX idx(id);
INSERT INTO tab_with_index
	SELECT * FROM tab_no_index;
SELECT * FROM tab_with_index;


####
#会话 session_1 加锁复合条件的指定行
###
#打开事务
SET AUTOCOMMIT=0;

#给指定行加排他锁
SELECT * FROM tab_with_index
	WHERE id=1
	FOR UPDATE;

#关闭事务
SET AUTOCOMMIT=1;

####
#会话 session_2 可以加锁其他未被加锁的行
###
SET AUTOCOMMIT=0;
SELECT * FROM tab_with_index
	WHERE id=2
	FOR UPDATE;

#关闭事务
SET AUTOCOMMIT=1;