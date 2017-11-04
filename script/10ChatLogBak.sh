#!/bin/bash
# this  script for  Chat log clear & Package
# this  script  wirite by lo in  2011-10-18 11:29
yesterday=`date -d "yesterday" +"%Y-%m-%d"`
FilePath="/mnt/mfs/chatlog/"
File="chat_communication_$yesterday.tar.gz"
Path1="/u/imm/chat1/logs/communication"
Path2="/u/imm/chat1/logs/"

cd $Path1

echo "tar zcf  $FilePath$File ./$yesterday " 
tar zcf  $FilePath$File ./$yesterday 
 
if [ $? -eq 0 ]; then
   echo "Backup Succeed!!!"
   echo "Backup file is: $File"
   find $Path2 -type d -name "$yesterday" | xargs  rm -rf
else
   echo "Backup Failed!!!"
fi
