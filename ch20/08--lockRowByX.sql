####
#使用排他锁锁定记录的写操作
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
	FOR UPDATE;

#本事务可以写操作，但需要提交后才真正写入数据文件
UPDATE actor SET last_name='MONROET 3'
	WHERE actor_id=178;

#提交
COMMIT;

#关闭事务
SET AUTOCOMMIT=1;

####
#会话 session_2
###
#开始事务
SET  AUTOCOMMIT=0;

#查询其他排他锁记录
SELECT actor_id,first_name,last_name FROM actor
	WHERE actor_id=178;

#不能对排他锁记录再加共享锁
SELECT actor_id,first_name,last_name FROM actor
	WHERE actor_id=178
	LOCK IN SHARE MODE;

#其他排他锁被释放后，才可以新增排他锁
UPDATE actor SET last_name='MONROET 4'
	WHERE actor_id=178
	FOR UPDATE;

#关闭事务
SET AUTOCOMMIT=1;
