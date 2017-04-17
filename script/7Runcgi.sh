#!/bin/bash

#cgi脚本重启操作

# Replace these three settings.
#定义当前脚本所在的路径
PROJDIR=$(cd $(dirname $0) && pwd)
#定义pid文件
PIDFILE="$PROJDIR/sgassist.pid"
#定义一个IP地址
HOST="127.0.0.1"
#定义个端口
PORT=8081


#停止服务
cd $PROJDIR
if [ -f $PIDFILE ]; then
    kill `cat $PIDFILE`  服务的停止操作
    rm -f  $PIDFILE  删除PID文件
fi

#开始执行启动
exec /usr/bin/env - \
  PYTHONPATH="../python:.." \
  ./manage.py runfcgi  pidfile=$PIDFILE host=$HOST port=$PORT

#服务就启动成功
最好判断一下服务的启动成功或者失败

#Python celery服务的重启
 /etc/init.d/sgassist_celeryd restart
 /etc/init.d/sgassist_celerybeat restart


 《卡牌三国》的游戏
 Python flask框架

 


