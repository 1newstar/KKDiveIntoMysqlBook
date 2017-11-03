####
#不同记录也会被相同的索引导致等待
###
#删除索引
ALTER TABLE tab_with_index
	DROP INDEX name;

#插入新数据
INSERT INTO tab_with_index VALUES(1,'4');

#查询
SELECT * FROM tab_with_index
	WHERE id=1;


####
#会话 session_1 锁定id=1的记录
###
SET AUTOCOMMIT=0;

SELECT * FROM tab_with_index
	WHERE id=1
		AND name='1'
	FOR UPDATE;

SET AUTOCOMMIT=1;

####
#会话 session_2 尝试锁定 id=1 的不同记录，必须等待了
###
SET AUTOCOMMIT=0;

SELECT * FROM tab_with_index
	WHERE id=1
		AND name='4'
	FOR UPDATE;

SET AUTOCOMMIT=1;