####
#中间表优化大表统计查询
###
#创建表 session
DROP TABLE IF EXISTS session;
CREATE TABLE session(
	cust_id VARCHAR(20), -- 客户编号
	cust_amount DECIMAL(16,2), -- 客户消费金额
	cust_date DATE, -- 客户消费时间
	cust_ip VARCHAR(20) -- 客户ip 地址
);

#查询表 session
SELECT * FROM session;

#直接在大表上统计
#——》效率很低
SELECT SUM(cust_amount) FROM session
	WHERE cust_date>ADDDATE(NOW(),-7);

#创建中间表 tmp_session
#该中间表与主表 session 结构相同
DROP TABLE IF EXISTS tmp_session;
CREATE TABLE tmp_session(
	cust_id VARCHAR(20), -- 客户编号
	cust_amount DECIMAL(16,2), -- 客户消费金额
	cust_date DATE, -- 客户消费时间
	cust_ip VARCHAR(20) -- 客户ip 地址
);

#转移要统计的数据到中间表
INSERT INTO tmp_session
	SELECT * FROM session
		WHERE cust_date>ADDDATE(NOW(),-7);

#在中间表上进行统计
SELECT SUM(cust_amount) FROM tmp_session;