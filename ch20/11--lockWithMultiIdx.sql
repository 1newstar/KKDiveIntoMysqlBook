####
#多索引可以被不同事务用来加锁，访问到同一行依旧互斥
###
#添加索引
ALTER TABLE tab_with_index
	ADD INDEX name(name);

#查看索引
SHOW INDEX FROM tab_with_index;

####
#会话 session_1 使用 id=1 锁住记录
###
SET AUTOCOMMIT=0;

SELECT * FROM tab_with_index
	WHERE id=1
	FOR UPDATE;

SET AUTOCOMMIT=1;

####
#会话 session_2 使用 name='2' 锁住记录
###
SET AUTOCOMMIT=0;

SELECT * FROM tab_with_index
	WHERE name='2'
	FOR UPDATE;

#不能再访问被其他锁锁住的记录
SELECT * FROM tab_with_index
	WHERE name='4'
	FOR UPDATE;

SET AUTOCOMMIT=1;