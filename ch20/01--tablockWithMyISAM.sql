####
#MyISAM 存储引擎支持表锁
###
#查看锁竞争状态
SHOW STATUS LIKE 'table%';

####
#会话 session_1 获取写锁
###
#——》其他会话的读写请求必须等待
#修改表的存储引擎
ALTER TABLE film_text ENGINE=MyISAM;
#上写锁
LOCK TABLE film_text WRITE;
#锁下查询
SELECT film_id,title FROM film_text WHERE film_id=1001;
#锁下插入
INSERT INTO film_text(film_id,title) VALUES(1003,'Test');
#锁下更新
UPDATE film_text SET title='Test'
	 WHERE film_id=1001;
#开写锁
#——》等待池开始竞争
UNLOCK TABLES;

####
#会话 session_2 处于等待会话 session_1 的写锁状态
###
#无法进行任何操作
SELECT film_id,title FROM film_text
	WHERE film_id=1001;