####
#并发存取单表记录时，最好以排序后的相同行顺序去操作
##

####
#-----------------行乱序操作易导致死锁
###
####
#会话 session_1 先操作 actor_id=1 后操作行 actor_id=3
###
SET AUTOCOMMIT=0;

#先操作 actor_id=1
SELECT first_name,last_name FROM actor
	WHERE actor_id=1
	FOR UPDATE;

#后操作行 actor_id=3
SELECT first_name,last_name FROM actor
	WHERE actor_id=3
	FOR UPDATE;

COMMIT;

SET AUTOCOMMIT=1;

####
#会话 session_2 先操作 actor_id=3 后操作行 actor_id=1
###
SET AUTOCOMMIT=0;

#先操作 actor_id=3
SELECT first_name,last_name FROM actor
	WHERE actor_id=3
	FOR UPDATE;

#后操作行 actor_id=1
SELECT first_name,last_name FROM actor
	WHERE actor_id=1
	FOR UPDATE;

COMMIT;

SET AUTOCOMMIT=1;


