####
#并发存取多个表时候，最好以约定的相同顺序去存取，可以避免死锁
###

####
#-------------操作不同表的顺序不同，易导致死锁
###
####
#会话 session_1 先锁 actor 后插 country
###
SET AUTOCOMMIT=0;

#先锁 actor
SELECT first_name,last_name FROM actor
	WHERE actor_id=1
	FOR UPDATE;

###此时会话 session_2 插入表 country

#后插 country
#会话 session_2 插入尚未提交，所以被锁定，需要等待
INSERT INTO country(country_id,country)
	VALUES(110,'Test');

###此时会话 session_2 尝试获取表 actor 的排他锁

#再次尝试插入表 country
INSERT INTO country(country_id,country)
	VALUES(110,'Test');

COMMIT;

SET AUTOCOMMIT=1;


####
#会话 session_2 先插 country 后锁 actor
###
SET AUTOCOMMIT=0;

#先插 country
INSERT INTO country(country_id,country)
	VALUES(112,'Test2');

#后锁 actor
SELECT first_name,last_name FROM actor
	WHERE actor_id=1
	FOR UPDATE;

SET AUTOCOMMIT=1;

