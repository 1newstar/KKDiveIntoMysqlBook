####
#数据导出工具 mysqldump
###
#连接远程数据库，并备份
mysqldump -h192.168.1.195 -P3306 -uroot -p kk > kk.txt

#-d，只导出表的创建语句，不包含任何其他信息
mysqldump -uroot -p --compact -d sakila actor > actor.txt

#-c,--complete-insert，使 INSERT 语句包含指定的字段
mysqldump -uroot -p --compact -c sakila actor > actor.txt

#-T,--tab 将建表 SQL 和数据分开存储
mysqldump -uroot -p sakila actor -T ./actor

