####
#使用符号连接分布io
###

####
#-------------Linux系统上
###
#在目标磁盘上创建目录
mkdir /otherdisk/databases/test
ln -s /otherdisk/databases/test /path/to/datadir

#创建支持自定义目录的存储引擎 MyISAM 的表
CREATE TABLE  test(
	id INT PRIMARY KEY,
	name VARCHAR(20)
) ENGINE=MyISAM

DATA DIRECTORY='/disk2/data'
INDEX DIRECTORY='/disk3/data';