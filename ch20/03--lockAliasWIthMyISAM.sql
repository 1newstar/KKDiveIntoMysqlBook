####
#MyISAM被锁表的别名也要上锁,
#表别名等价于一个新的虚拟表
###
#加读锁
LOCK TABLE actor READ;

#通过别名访问会报错
SELECT a.first_name,a.last_name,b.first_name,b.last_name
	FROM actor a, actor b
	WHERE a.first_name=b.first_name
		AND a.first_name='Lisa'
		AND a.last_name='Tom'
		AND a.last_name <> b.last_name;

#给别名表加读锁
LOCK TABLE actor AS a READ,
			actor AS b READ;

#此时可以通过别名别问
SELECT a.first_name,a.last_name,b.first_name,b.last_name
	FROM actor a, actor b
	WHERE a.first_name=b.first_name
		AND a.first_name='Lisa'
		AND a.last_name='Tom'
		AND a.last_name <> b.last_name;

#解锁
UNLOCK TABLES;

