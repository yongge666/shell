#!/bin/bash
#日志切割 一般用来切割Nginx的服务日志

LOGPATH=/log/nginx
LOGFILE1=bigbang.access
ERRORLOG=error
DATE=`date -d"yesterday" +"%F"`
YEAR=`date +%Y`
MONTH=`date +%m`
#创建以年为命名的目录和以月命名的目录，判断目录不存在，然后自动创建
   [ ! -d ${LOGPATH}/${YEAR} ] && mkdir ${LOGPATH}/${YEAR}
   [ ! -d ${LOGPATH}/${YEAR}/${MONTH} ] && mkdir ${LOGPATH}/${YEAR}/${MONTH}

#把bingbag.access.log error.log挪到比如2017/7这个目录下面，并打上时间戳
mv ${LOGPATH}/${LOGFILE1}.log   ${LOGPATH}/${YEAR}/${MONTH}/${LOGFILE1}_${DATE}.log
mv ${LOGPATH}/${ERRORLOG}.log   ${LOGPATH}/${YEAR}/${MONTH}/${ERRORLOG}_${DATE}.log
kill -USR1 `cat /log/nginx/nginx.pid`  给Nginx发送一个信号，让Nginx重新生成日志文件 （暂时可以理解为让Nginx重启）

先把老的日志挪走，再生成新的日志文件
没有执行压缩
没有执行删除操作 只保留一个月的，把一个月以前的全部删除掉
