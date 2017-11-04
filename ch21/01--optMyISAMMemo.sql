####
#优化MyISAM的缓存
###

#创建新的会话共享的索引缓存 hot_cache
SET GLOBAL hot_cache.key_buffer_size=128*1024;//128k

#删除会话共享缓存 hot_cache
SET GLOBAL hot_cache.key_buffer_size=0;

#查看默认的索引缓存
SHOW VARIABLES LIKE 'key_buffer_size';


#不能删除默认的索引缓存
SET GLOBAL key_buffer_size=0;

#显示警告
SHOW WARNINGS;

#设置指定表的索引缓存
CACHE INDEX payment_myisam IN hot_cache;


####
#--------------配置文件创建和指定索引缓存
###
#自定义的热表索引缓存
hot_cache.key_buffer_size=2G
#自定义的冷表索引缓存
cold_cache.key_buffer_size=1G
#设置索引缓存初始化sql文件
init_file=/mysqld_init.sql

#mysqld_init.sql 中加载和指定缓存
CACHE INDEX sales1 IN hot_cache;
CACHE INDEX sales2 IN cold_cache;
LOAD INDEX INTO CACHE sales1,sales2;

####
#启用中点插入策略
###
SET GLOBAL key_cache_division_limit=70; -- 即30%的热表区
SET GLOBAL hot_cache.key_cache_division_limit=70;

####
#配置文件修改读缓存和排序缓存
###
#默认的读缓存（各 session 独占）
read_buffer_size=64K
#默认的排序缓存（各 session 独占）
read_rnd_buffer_size=256K

