#!/bin/bash

#获取数据库里面以sailing开头或者是包含sailing的数据库，把库名取出来，赋给DATABASE这个变量
DATABASE=`/opt/mysql/bin/mysql -uroot -e"show databases\G" | grep "Database" | grep "sailing" | awk '{print $2}'`

#for
 for I in $DATABASE ; do
     echo "Clear $I..."
#直接删除$I 传递过来的包含sailing这个库名的数据库，然后执行删除操作。
 /opt/mysql/bin/mysql -uroot -e "drop database $I"
     echo "$I dead."
  done 
 
 [ $? -eq 0 ] && echo "OK,ALL Done!" || echo "Failure."
 echo "---`date +"%F %H:%M:%S"` MySQL ALL Databases dropped.---" >>clear.log
