#! /bin/sh

cur_path=$(cd $(dirname $0) && pwd)

log_path=$cur_path/../log
bak_path=$cur_path/../log/backup
[ ! -d $bak_path ] && mkdir -p $bak_path


access_log=access.log
error_log=error.log
access_log_bak=$bak_path/access_`date -d "yesterday" +"%Y%m%d"`.tar.gz
error_log_bak=$bak_path/error_`date -d "yesterday" +"%Y%m%d"`.tar.gz

cd $log_path

if [ -f $access_log ];then
    #backup access log
    tar czf $access_log_bak $access_log
    echo "" > $access_log
fi

if [ -f $error_log ];then
    #backup error log
    tar czf $error_log_bak $error_log
    echo "" > $error_log
fi

find $bak_path/ -type f -mtime +5 | xargs rm

