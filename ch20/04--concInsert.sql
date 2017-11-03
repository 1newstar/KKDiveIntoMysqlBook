####
#MyISAM 支持并发尾部插入
###
#-------------------会话 session_1 上读锁
LOCK TABLE film_text READ LOCAL; -- LOCAL 意味着别的进程可以并发尾部插入

#读锁不能写
INSERT INTO film_text(film_id,title) VALUES(1002,'Test');
UPDATE film_text SET title='Test'
	WHERE film_id=1001;

#不能方位其他会话尾部并发插入的记录
SELECT film_id,title FROM film_text
	WHERE film_id=1002;

#解锁
UNLOCK TABLES;

#-----------------会话 session_2 并发尾部插入
INSERT INTO film_text(film_id,title)
	VALUES(1002,'Test');

#不可以更新其他会话锁定的表
#需要等待
UPDATE film_text SET title='update Test'
	WHERE film_id=1001;

#目标表的锁被释放后
#可以更新啦
UPDATE film_text SET title='update Test'
	WHERE film_id=1001;

