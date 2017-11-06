####
#逻辑备份
###

####
#---------------------常规逻辑备份
###
#备份所有数据库
mysqldump -uroot -p --all-databases > all.sql

#备份指定数据库（所有表）
mysqldump -uroot -p sakila > sakila.sql

#备份指定数据库下的单个表
mysqldump -uroot -p sakila actor> actor.sql

#备份指定数据库下的多个表
mysqldump -uroot -p sakila actor city> actor_city.sql

#备份时候按 ',' 分隔字段
mysqldump -uroot -p -T ./tmp sakila actor --fields-terminated-by ","
