####
#Next Key 加锁，对不存在的记录（缝隙）也会加锁，导致其他事务无法插入新记录
###
####
#会话 session_1 对不存在的记录加锁
# 导致其他会话不能插入新记录
###
SET AUTOCOMMIT=0;

SELECT * FROM emp
	WHERE id=102
	FOR UPDATE;

SET AUTOCOMMIT=1;

####
#会话 session_2 尝试插入新记录已经不行啦，
#	必须等待
###
SET AUTOCOMMIT=0;

INSERT INTO emp(id) VALUES(103);

SET AUTOCOMMIT=1;