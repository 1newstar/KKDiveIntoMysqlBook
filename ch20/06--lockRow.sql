####
#用行锁添加锁住行
###
####
#-------------行共享锁，自写会死锁，可以用其他写请求开锁
###
####
#会话 session_1 行共享锁
###
#开启事务
SET AUTOCOMMIT=0;

#查询
SELECT actor_id,first_name,last_name FROM actor
	WHERE actor_id=178;

#查询加共享锁
SELECT actor_id,first_name,last_name FROM actor
	WHERE actor_id=178
	LOCK IN SHARE MODE;

#自写共享锁记录会死锁
#——》等待
UPDATE actor SET last_name='MONROET 1'
	WHERE actor_id=178;

#死锁被其他会话的写请求打开
#可以更新
UPDATE actor SET last_name='MONROET 2'
	WHERE actor_id=178;

#关闭事务
SET AUTOCOMMIT=1;

####
#会话 session_2
###
#开始事务
SET  AUTOCOMMIT=0;

#查询其他会话共享锁记录
SELECT actor_id,first_name,last_name FROM actor
	WHERE actor_id=178;

#在其他共享锁行上加共享锁
SELECT actor_id,first_name,last_name FROM actor
	WHERE actor_id=178
	LOCK IN SHARE MODE;

#更新会导致其他会话的死锁解除
UPDATE actor SET last_name='MONROET 3'
	WHERE actor_id=178;

#关闭事务
SET AUTOCOMMIT=1;











