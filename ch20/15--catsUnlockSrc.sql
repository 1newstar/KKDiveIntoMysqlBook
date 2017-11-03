####
# 关闭 CATS 操作的源表锁定，将导致数据的复制和恢复出现不一致
###
####
#会话 session_1 开启 BINLOG 的非安全机制
#   将导致 CATS 操作并不锁定源表
###
SET AUTOCOMMIT=0;

SET innodb_locks_unsafe_for_binlog='on';-- 开启

INSERT INTO target_tab(d1,name)
	SELECT d1,name FROM source_tab
		WHERE name='1';	-- 源表并不会锁定

#其他会话写源表后再提交
COMMIT;

#其他会话更新源表后
#再次查询源表
SELECT * FROM source_tab
	WHERE name='8';

#查询目标表
SELECT * FROM target_tab;


SET AUTOCOMMIT=1;
SET innodb_locks_unsafe_for_binlog='off';-- 关闭


####
#会话 session_2 可以无阻碍的更新源表 source_tab
#   将导致数据的复制和恢复不一致
###
SET AUTOCOMMIT=0;

#无阻碍写源表
UPDATE source_tab SET name='8'
	WHERE name='1';

SELECT * FROM source_tab
	WHERE name='8';

#先提交
COMMIT;

SET AUTOCOMMIT=1;
