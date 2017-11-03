####
#MyISAM手动枷锁，保证某个时间点的事务的一致性
###
#加锁多个表
LOCK TABLES orders READ LOCAL, -- 订单表加本地读锁
		order_detail READ LOCAL, -- 订单详情表加本地读锁
	#读锁下查询，保证查询的一致性
	SELECT SUM(total) FROM orders;
	SELECT SUM(subtotal) FROM order_detail;
#解开锁
UNLOCK TABLES;

####
#MyISAM 的表锁上锁后，只能操作加锁的表，
#操作其他表会报错，因此不会 '死锁'
###
#会话 session_1 读锁阻塞
#加读锁
LOCK TABLE film_text READ; -- 只能再操作此表
#操作加锁表
SELECT film_id,title FROM film_text
	WHERE film_id=1001; -- 可以操作

#尝试操作其他表
#--》会报错，不被允许
SELECT film_id,title FROM film
	WHERE film_id=1001;

#尝试写操作读锁表
#——》也不行
INSERT INTO film_text(film_id,title) VALUES(1002,'Test');

UPDATE film_text SET title='Test' WHERE film_id=1001;

#释放锁
UNLOCK TABLES;

#会话 session_2
#尝试使操作其他未被锁定的表
#——》当然可以
SELECT film_id,title FROM film
	WHERE film_id=1001;

UPDATE film SET title='Test'
	WHERE film_id=1001;

#尝试更新被锁定的表会等待
UPDATE film_text SET title='Test' film_id=1001;

#被锁定的表被释放后，可以进行更新
UPDATE film_text SET title='Test' film_id=1001;
