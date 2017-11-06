####
#修改密码
###
#mysqladmin 命令行修改密码
mysqladmin -u z5 -h localhost password "123456"

#SET PASSWORD 修改密码
SET PASSWORD FOR z5@localhost=PASSWORD('111111');

#GRANT 修改密码
GRANT USAGE ON *.* TO z5@localhost IDENTIFIED BY '123456';

