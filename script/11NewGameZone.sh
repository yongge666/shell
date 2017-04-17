#!/bin/bash
#Open new zone for RXQQ and DZL
#Author:Li Yuanpeng
#Date:20121213
#Version:1.0

#读取新区的变量
. serverbase.sh

#定义一个时间戳
DATE=`date +%F`
#定义代码模板目录
DIR=/cygdrive/d/RXQQ

[ ! -d ${DIR}/web/${ZONE} ] && mkdir -p ${DIR}/web/${ZONE}
[ ! -d ${DIR}/service/${ZONE} ] && mkdir -p ${DIR}/service/${ZONE}

#把代码模板拷到新创建新区的目录中
cp -rf ${DIR}/standard/web/  ${DIR}/web/${ZONE}/${NO}
cp -rf ${DIR}/standard/HBservice/  ${DIR}/service/${ZONE}/${NO}

SERDIR=${DIR}/service/${ZONE}/${NO}
WEBDIR=${DIR}/web/${ZONE}/${NO}

#echo "${WEBDIR}"
#echo "${SERDIR}"
#echo "${MASTERIP}"
#echo "${MATCHIP}"
#echo "${SHADOWIP}"


#生成新区的配置文件
find ${SERDIR}/*  -name "*.config" | xargs sed -i -e 's/MASTERIP/'${MASTERIP}'/g' -e 's/MATCHIP/'${MATCHIP}'/g' \
     -e 's/SHADOWIP/'${SHADOWIP}'/g' -e 's/CENTERIP/'${CENTERIP}'/g'  \
         -e 's/DBNAME/'${DBNAME}'/g' -e 's/DBUSER/'${DBUSER}'/g'

sed -i 's/FLASHDIR/'$FLASHDIR'/g' ${DIR}/web/${ZONE}/${NO}/Activity.aspx
sed -i 's/FLASHDIR/'$FLASHDIR'/g' ${DIR}/web/${ZONE}/${NO}/Index.aspx
sed -i 's/FLASHDIR/'$FLASHDIR'/g' ${DIR}/web/${ZONE}/${NO}/Match.aspx

sed -i  -e 's/COOKDOMAIN/'$COOKDOMAIN'/g' -e 's/PLATURL/'$PLATURL'/g' \
      -e 's/SERVERNAME/'$SERVERNAME'/g' -e 's/MASTERIP/'${MASTERIP}'/g' \
      -e 's/MATCHIP/'${MATCHIP}'/g' \
      -e 's/SHADOWIP/'${SHADOWIP}'/g' -e 's/CENTERIP/'${CENTERIP}'/g'  \
      -e 's/DBNAME/'${DBNAME}'/g' -e 's/DBUSER/'${DBUSER}'/g'  ${WEBDIR}/Web.config

#生成日志文件 使用heredocument
cat>>${DIR}/service/${ZONE}/${NO}/openzone.log<<EOF
${ZONE}
${DATE}
EOF

#把unix格式的文件转换成doc 
unix2dos  ${SERDIR}/openzone.log
find ${SERDIR}/* -name "*.config"  | xargs unix2dos
unix2dos ${WEBDIR}/Activity.aspx
unix2dos ${WEBDIR}/Index.aspx
unix2dos ${WEBDIR}/Match.aspx
unix2dos ${WEBDIR}/Web.config

 
