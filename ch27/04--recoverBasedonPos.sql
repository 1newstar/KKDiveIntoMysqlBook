####
#基于位置的不完整恢复
###
#复制误操作点附近的日志到一个小的日志文件
#——》便于查找误操作点的位置
mysqlbinlog --start-date="2005-04-20 9:55:00" --stop-date="2005-04-20 10:05:00" DESKTOP-6POJJMP-bin.000002 | wrong.sql

#查看误操作点的前后最小精确位置后，以此作为位置恢复的分割点
#恢复误操作位置前的数据
mysqlbinlog --stop-position="368312" DESKTOP-6POJJMP-bin.000002 | mysql -uroot -p

#恢复误操作点位置后的数据
mysqlbinlog --start-position="368315" DESKTOP-6POJJMP-bin.000002 | mysql -uroot -p