#/bin/bash 
    SLEEPTIME=600 
    while true 
      do 
           FIGHTID=`ps aux | grep fight_server | grep -v "grep" | wc -l` 
            if [ $FIGHTID -lt 1 ];  then 
               echo "---`date +"%F %H:%M:%S"`-----Fight Server Abort and restart." >> /data/gameserver/fight/fight_monitor.log 
               /data/gameserver/fight/boot.sh 1 （执行服务启动操作）
            fi 
     
           CLEANID=`ps aux | grep fight_clean | grep -v "grep" | wc -l` 
            if [ $CLEANID -lt 1 ];  then 
               echo "---`date +"%F %H:%M:%S"`-----Fight Clean Server  restart." >> /data/gameserver/fight/fight_monitor.log 
               /data/gameserver/clean/boot.sh （执行服务启动操作）
            fi 
           
           POLICYID=`ps aux | grep policy_server | grep -v "grep" | wc -l` 
            if [ $POLICYID -lt 1 ];  then 
               echo "---`date +"%F %H:%M:%S"`-----Policy Server  restart." >> /data/gameserver/fight/fight_monitor.log 
               /data/gameserver/policy/boot.sh  （执行服务启动操作）
            fi 
 
      sleep $SLEEPTIME 
     
    done  
