####
#MyISAM 表的维护工具 mysqlcheck
###
#检查表
mysqlcheck -uroot -p -c kk

#修复表
mysqlcheck -uroot -p -r kk

#分析表
mysqlcheck -uroot -p -a kk

#优化表
mysqlcheck -uroot -p -o kk