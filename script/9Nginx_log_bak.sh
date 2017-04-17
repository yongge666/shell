#!/bin/bash

logs_path="/u/long/nginx/logs/"
cd $logs_path

tmpfile=`ls *.log > $logs_path/tmp.txt`
tmpfile1=`ls *net >> $logs_path/tmp.txt`
tmpfile2=`ls *com >> $logs_path/tmp.txt`
tmpfile3=`ls *org >> $logs_path/tmp.txt`

logfile=`cat $logs_path/tmp.txt`

date=`date -d "yesterday" +"%Y%m%d"`
save_path=${logs_path}/$(date -d "yesterday" +"%Y")/$(date -d "yesterday" +"%m")
[ ! -d $ave_path] && mkdir -p ${save_path}

for log in ${logfile};
	do
           mv ${logs_path}/${log} ${save_path}/${log}.${date}.log;
	   echo "=======${log}======"
	done

kill -USR1 `cat $logs_path/nginx.pid` 重新生成日志文件
rm -rf  $logs_path/tmp.txt
