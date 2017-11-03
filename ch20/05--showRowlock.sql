####
#查看InnoDB行锁竞争情况
###
#查看 InnoDB 行锁状态
SHOW STATUS LIKE 'Innodb_row_lock%';


#查询行锁记录表 innodb_locks
SELECT * FROM information_schema.innodb_locks;

#创建行锁观察器表 innodb_monitors
DROP TABLE IF EXISTS innodb_monitors;
CREATE TABLE innodb_monitors(
	a INT
) ENGINE=InnoDB;

#查看存储引擎状态
SHOW ENGINE InnoDB STATUS;

#停止行锁监视器
DROP TABLE IF EXISTS innodb_monitors;