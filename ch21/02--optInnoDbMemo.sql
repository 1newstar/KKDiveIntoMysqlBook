####
#优化InnoDB存储的内存
###
####
#配置文件修改 InnoDB 缓存池的大小
###
innodb_buffer_pool_size=8M


#查看旧子列表的比例
#——》默认37%
SHOW GLOBAL VARIABLES LIKE '%innodb_old_blocks_pct%';

#配置文件修改 InnoDB 的旧子表超时时间
innodb_old_blocks_time=1000

#配置文件修改 InnoDB 缓存池的实例数量
innodb_buffer_pool_instances=8

#查看双写状态
#——》默认是开启的
SHOW GLOBAL VARIABLES LIKE '%doublewrite%';


#配置文件设置全局排序缓存和连接查询缓存
join_buffer_size=256K
sort_buffer_size=256K