####
#资源控制
###
#创建用户 z1@localhost
GRANT SELECT ON test.* TO z1@localhost
	WITH MAX_QUERIES_PER_HOUR 3 -- 每小时最大查询次数
	MAX_USER_CONNECTIONS 5; -- 最多5个此用户并发

#查询 z1@localhost 的资源分配
SELECT user,max_questions,max_updates,max_connections FROM user
	WHERE user='z1';



