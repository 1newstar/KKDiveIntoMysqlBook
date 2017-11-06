####
#慢查询日志
###
#显示慢查询超时时间
SHOW VARIABLES LIKE 'long%';

#设置慢查询超时时间为 0.002 秒
SET long_query_time=0.002;


#尝试慢查询
SELECT * FROM actor a1,actor a2,actor a3
	WHERE a1.actor_id=a2.actor_id
		AND a2.actor_id=a3.actor_id;

#查看慢查询的存储方式
SHOW VARIABLES LIKE '%output%';

#分类汇总慢查询日志记录
mysqldumpslow DESKTOP-6POJJMP-slow.log