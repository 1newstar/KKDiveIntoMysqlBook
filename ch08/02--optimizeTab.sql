####
#OPTIMIZE 定期清理text或blob型表的碎片
###

#创建表 t
CREATE TABLE t(
	id VARCHAR(100),
	context TEXT
);

#向表 t 中插入大量字符串
INSERT INTO t
	VALUES(1,REPEAT('haha',100)),
		(2,REPEAT('haha',100)),
		(3,REPEAT('haha',100));

#多次拷贝自己
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);
INSERT INTO t (SELECT * FROM t);


#优化表 t
#——>删除数据空洞，数据文件变小
OPTIMIZE TABLE t;