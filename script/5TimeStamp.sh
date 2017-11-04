#!/bin/bash 
##ADD timestamp to error log
##Li Yuanpeng
##20141008
##1.0

#查找获取所有的名字包含error错误日志信息，然后使用for循环的方式给每个日志内加时间戳
PM2LOG=`find /root/.pm2/logs/ -name "*err*"`
UCLOG=`find /opt/mstuc/logs/ -name "*err*"`
BANGLOG=`find /opt/bigbang_rc/logs/ -name "*err*"`

   for LOG in ${PM2LOG} ${UCLOG} ${BANGLOG}; do
   	echo -e "\033[31m-----------`date +"%F %H:%M:%S"`---------------\033[0m"  >>  ${LOG}
   done


fdfdf
fdfdf
------2017-03-03 12:31
fdfdf
fdfdf
fdfdf
fdfdf
------2017-03-04 12:30
fdfdffdf

想排查3-5点时间的日志

要结合计划任务（crontab）

