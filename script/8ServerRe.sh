#!/bin/bash
##Restart all service.
##Li Yuanpeng
##20140919

#重启所有的服务


. /etc/profile
    
杀所有包含pm2关键字的进程（关闭指令）
pkill pm2 

COUNT=`ps aux | grep "pm2" | grep -v "grep" | wc -l`
[ ${COUNT} -ne 0 ] && pkill pm2 || sleep 5

#执行启动操作
[ -d /opt/mstuc ] && cd /opt/mstuc/  &&  /opt/node/bin/pm2 start bin/www -n 'mstuc'
[ -d /opt/mstpc ] && cd /opt/mstpc/ && /opt/node/bin/pm2 start bin/www -n 'mstpc'
[ -d /opt/bigbang_rc ] && cd /opt/bigbang_rc/ && /opt/node/bin/pm2 start bin/www -n 'bigbang_rc' -i max 
[ -d /opt/dragonseal ] && cd /opt/dragonseal/ && /opt/node/bin/pm2 start bin/www -n 'dragonseal' 
[ -d /opt/adv-agent ] &&  cd /opt/adv-agent/ && /opt/node/bin/pm2  start bin/www -n "adv-agent"
[ -d /opt/dragonseal_h5 ] &&  cd /opt/dragonseal_h5/ && /opt/node/bin/pm2 start bin/www -n 'dragonseal_h5' 


#先杀进程，杀完直接起
node.js 一种语言