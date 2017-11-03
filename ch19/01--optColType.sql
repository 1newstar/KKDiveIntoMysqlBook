####
#优化字段的数据类型
###
#创建用于字段优化的测试表 duck_cust
DROP TABLE IF EXISTS duck_cust;
CREATE TABLE duck_cust(
	cust_num MEDIUMINT AUTO_INCREMENT, -- 客户编号
	cust_title TINYINT, -- 客户标题
	cust_last CHAR(20) NOT NULL, -- 客户姓氏
	cust_first CHAR(15) NOT NULL, -- 客户名
	cust_stuffix ENUM('Jr.','II','III','IV','V','M.D','phD'), -- 附加码
	cust_add1 CHAR(30) NOT NULL, -- 客户地址
	cust_add2 CHAR(10),-- 客户地址
	cust_city CHAR(18) NOT NULL, -- 客户所在城市
	cust_state CHAR(2) NOT NULL, -- 客户所在州
	cust_zip1 CHAR(5) NOT NULL,-- 客户邮编
	cust_zip2 CHAR(4),-- 客户邮编
	cust_duckname CHAR(25) NOT NULL, -- 客户名称
	cust_duckbday DATE,-- 客户生日
	PRIMARY KEY(cust_num)
) ENGINE=MyISAM;

#插入测试数据
INSERT INTO duck_cust
	 VALUES(NULL,1,'Irishlord','Red','III','1022 N.E Sea of Rye','A207','Seacouver','WA','98601','3464','Netrek Rules','1967:10:21'),
	 	(NULL,4,'Thegreat','Vicki',0,'2004 Singleton Dr.',0,'Freedom','KS','67209','4321','Frida Kahlo de Tomayo','1948:03:21'),
	 	(NULL,9,'Montgomery','Chantel',0,'1567 Terra Cotta way',0,'Chicago','IL','89129','4444','Bianca','1971:07:29'),
	 	(NULL,7,'Robert','David','Sr.','20113 Open Road Highway','#6','Blacktop','AZ','00606','1952','Harley','1949:08:00'),
	 	(NULL,5,'Kazui','Wonko','PhD','42 Cube Farm Lane','Catehouse','Vlimpt','CA','45362',0,'Fitzwhistle','1961:12:04'),
	 	(NULL,6,'Gashlycrumb','Karen',0,'3113 Picket Fence Lane',0,'Fedora','VT','41927','5698','Tess D'' urberville','1948:08:19');

#查询表 duck_cust
SELECT * FROM duck_cust;

#查看表结构 duck_cust
DESC duck_cust;

#分析表 duck_cust
SELECT * FROM duck_cust PROCEDURE ANALYSE();

#修改表的字段类型更合理
ALTER TABLE duck_cust MODIFY cust_num MEDIUMINT(2);





