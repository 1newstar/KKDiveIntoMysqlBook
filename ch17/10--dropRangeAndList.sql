####
#RNAGE 与 LIST 分区管理
###
#创建分区表 emp_date
DROP TABLE IF EXISTS emp_date;
CREATE TABLE emp_date(
	id INT NOT NULL,
	ename VARCHAR(30),
	hired DATE NOT NULL DEFAULT '1970-01-01',
	separated DATE NOT NULL DEFAULT '9999-12-31',
	job VARCHAR(30) NOT NULL,
	store_id INT NOT NULL
)
PARTITION BY RANGE(YEAR(separated))
(
	PARTITION p0 VALUES LESS THAN (1995),
	PARTITION p1 VALUES LESS THAN (2000),
	PARTITION p2 VALUES LESS THAN (2005),
	PARTITION p3 VALUES LESS THAN (2015)
);

#查询表 emp_date
SELECT * FROM emp_date;

#插入测试数据 emp_date
INSERT INTO emp_date(id,ename,hired,separated,job,store_id)
	VALUES(7499,'ALLEN','1981-02-30','2003-08-03','SALESMAN',30),
		(7511,'WARD','1981-02-22','1993-09-01','SALESMAN',30),
		(7566,'JONES','1981-04-02','2000-08-01','MANAGER',20),
		(7654,'MARTIN','1981-09-28','2012-12-31','SALESMAN',30),
		(7698,'BLAKE','1981-05-01','1998-09-08','MANAGER',30),
		(7782,'CLARK','1981-06-09','2007-08-01','MANAGER',10),
		(7788,'SCOTT','1987-04-19','2012-05-01','ANALYST',20),
		(7839,'KING','1981-11-17','2011-03-09','PRESIDENT',10),
		(7844,'TURNER','1981-09-08','2010-12-31','SALESMAN',30),
		(7876,'ADAMS','1987-05-23','2000-01-01','CLERK',20),
		(7900,'JAMES','1981-12-03','2004-09-02','CLERK',30),
		(7902,'FORD','1981-12-03','2010-12-31','ANALYST',20),
		(7934,'MILLER','1982-01-23','2011-12-31','CLERK',10);

#查询表 emp_date 分区 p2 上的记录
SELECT * FROM emp_date
	WHERE separated BETWEEN '2000-01-01' AND '2004-12-31';


#删除表 emp_date 的 p2 分区
ALTER TABLE emp_date DROP PARTITION p2;

#查看表 emp_date 的创建定义
#——》已经无 p2 分区的定义
SHOW CREATE TABLE emp_date;

#再次查询表 emp_date 分区 p2 上的记录
#——》已经无记录
SELECT * FROM emp_date
	WHERE separated BETWEEN '2000-01-01' AND '2004-12-31';

#统计表 emp_date 的剩余记录数
SELECT count(1) FROM emp_date;

#查询分区数据
SELECT partition_name part,
	partition_expression expr,
	partition_description descr,
	table_rows
	FROM information_schema.partitions
	WHERE TABLE_SCHEMA=SCHEMA() AND TABLE_NAME='emp_date';


#插入测试数据 emp_date
#——》该记录将落入分区 p3
INSERT INTO emp_date(id,ename,hired,separated,job,store_id)
	VALUES(7566,'JONES','1981-04-02','2000-08-01','MANAGER',20);












