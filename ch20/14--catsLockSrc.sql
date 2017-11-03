####
#默认 CATS 操作会对源表指定记录进行加锁，
#   为的是保证表的复制和恢复
###

#创建源表 source_tab
DROP TABLE IF EXISTS source_tab;
CREATE TABLE source_tab(
	d1 INT,
	name VARCHAR(10),
	d2 INT,
	PRIMARY KEY(d1)
);

ALTER TABLE source_tab
	ADD INDEX idx_name(name);

SHOW INDEX FROM source_tab;

INSERT INTO source_tab
	VALUES(4,'1',1),
		(5,'1',1),
		(6,'1',1),
		(7,'1',1),
		(8,'1',1);

SELECT * FROM source_tab;

#创建目标表 target_tab
DROP TABLE IF EXISTS target_tab;
CREATE TABLE target_tab LIKE source_tab;

SHOW INDEX FROM target_tab;

SELECT * FROM target_tab;

####
#会话 session_1 CATS 操作导致锁定源表 source_tab 的指定记录
###
SET AUTOCOMMIT=0;

INSERT INTO target_tab(d1,name)
	SELECT d1,name FROM source_tab
		WHERE name='1';

COMMIT; -- 提交解除锁定

SET AUTOCOMMIT=1;


####
#会话 session_2 不能在写源表
###
SET AUTOCOMMIT=0;

UPDATE source_tab SET name='1'
	WHERE name='8';

COMMIT;

SET AUTOCOMMIT=1;