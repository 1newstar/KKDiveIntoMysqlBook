####
#可重读级别下，并发加锁不存在的记录，易导致死锁
###

####
#---------------会话 session_1
###
#查询隔离级别
SELECT @@tx_isolation;

SET AUTOCOMMIT=0;

#对不存在的记录加锁
SELECT actor_id,first_name,last_name FROM actor
	WHERE actor_id=201
	FOR UPDATE;

############# 其他会话加锁

#插入新记录
#——》被其他会话的锁阻塞
INSERT INTO actor(actor_id,first_name,last_name)
	VALUES(201,'Lisa','Tom');

#############其他会话插入，导致 '死锁' 并退出

#再次尝试插入
INSERT INTO actor(actor_id,first_name,last_name)
	VALUES(201,'Lisa','Tom');

COMMIT;

SET AUTOCOMMIT=1;

####
#-----------------------会话 session_2
###
#查询隔离级别
SELECT @@tx_isolation;

SET AUTOCOMMIT=0;

###########其他会话加锁不存在的记录

#继续加锁不存在的记录
SELECT actor_id,first_name,last_name FROM actor
	WHERE actor_id=201
	FOR UPDATE;

############# 其他会话尝试插入新记录，但必须等待

#尝试插入新记录
#——》造成死锁，并退出
INSERT INTO actor(actor_id,first_name,last_name)
	VALUES(201,'Lisa','Tom');

SET AUTOCOMMIT=1;
