####
#mysqlshow 数据库对象查看工具
###
#不加任何参数，默认显示全部数据库
mysqlshow -uroot -p

#--count 不指定数据库或表，显示所有库的统计信息
mysqlshow -uroot -p --count

#--count 指定库，显示该库下所有表的统计信息
mysqlshow -uroot -p --count sakila

#--count 指定表，显示该表所有字段的统计信息
mysqlshow -uroot -p --count sakila actor

#--keys,-k 显示指定表的索引信息
#——》等价于 SHOW INDEX FROM actor
#——》等价于 SHOW FULL COLUMNS FROM actor
mysqlshow -uroot -p  sakila actor -k

#--status,-i 显示指定表的状态信息
#——》等价于 SHOW TABLE STATUS FROM sakila LIKE 'actor'
mysqlshow -uroot -p sakila actor -i