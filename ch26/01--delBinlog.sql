####
#删除二进制日志
###
#删除所有日志
RESET MASTER;

#删除指定日志之前的所有日志
PURGE MASTER LOGS TO 'localhost-bin.0000006';

#删除指定日期前的所有日志
PURGE MASTER LOGS BEFORE '2017-11-12 22:00:00';

