####
#基于时间点的恢复
###
#恢复误操作点之前的数据
mysqlbinlog --stop-date='2005-04-05 09:20:40' DESKTOP-6POJJMP-bin.000002 | mysql -uroot -p

#跳过误操作点，备份之后的数据
mysqlbinlog --start-date='2005-04-05 09:22:40' DESKTOP-6POJJMP-bin.000002 | mysql -uroot -p