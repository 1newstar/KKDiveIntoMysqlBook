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