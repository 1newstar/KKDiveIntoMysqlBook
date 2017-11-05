####
#日志管理工具 mysqlbinlog
###
#刷新日志
FLUSH LOGS;

#使用 mysql 系统库
use mysql;

#唤醒进程
REVOKE PROCESS ON *.* root@'%';


#使用数据库 kk
USE kk;

#删除表 t2 所有数据
TRUNCATE TABLE t2;

INSERT INTO t2 VALUES(1);

SELECT * FROM t2;

#查看所有日志
mysqlbinlog DESKTOP-6POJJMP-bin.000014

#-d 选项，只查看指定数据库的操作日志
mysqlbinlog DESKTOP-6POJJMP-bin.000014 -d kk

#-o 选项，指定日志的起始偏移量
mysqlbinlog DESKTOP-6POJJMP-bin.000014 -d -kk -o 3

#-r 选项，将结果输出到指定文件
mysqlbinlog DESKTOP-6POJJMP-bin.000014 -d -kk -o 3 -r tmplog.txt

#-s 选项,只显示简单信息
mysqlbinlog DESKTOP-6POJJMP-bin.000014 -d -kk -o 3 -s

#--stat-datetime --stop-datetime 起止时间
mysqlbinlog DESKTOP-6POJJMP-bin.000014 --start-datetime='2017/11/05 09:30:00' --stop-datetime='2017/11/05 10:30:00'

#--start-position,--stop-position 起止位置
mysqlbinlog DESKTOP-6POJJMP-bin.000014 --start-position=10 --stop-position=20
