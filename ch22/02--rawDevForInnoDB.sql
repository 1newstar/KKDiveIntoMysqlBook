####
#使用裸设备存储InnoDB的表
###
#配置文件增加裸设备文件名和 newraw 属性
innodb_data_file_path=/dev/hdd1:3Gnewraw;/dev/hdd2:2Gnewraw

#启动 MySQL ,完成初始化（包括新建裸设备），关闭 MySQL

#将 newraw 改为 raw
innodb_data_file_path=/dev/hdd1:3Graw;/dev/hdd2:2Graw

#重新启动 MySQL ,可以创建 InnoDB 的表了