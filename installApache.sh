#/*************************************************************************
#    > File Name: installApache.sh
#    > Author: liyong
#    > Mail: 2550702985@qq.com
#    > Created Time: Thu 20 Apr 2017 02:39:18 AM PDT
# ************************************************************************/
#!/bin/bash
[ $UID -ne 0 ] && {echo -e '\033[32m This scripit must be run by root \033[0m' && exit 2}
tarDir=/usr/src/
installDir=/opt/httpd/
confDir=/etc/httpd/
mkdir -p $installDir &> /dev/null
rpm -qa | grep httpd
if [ $? -eq 0 ];then
	yum -y remove httpd && echo -e '\033[32m The old version of apache has been removed!\033[0m '
fi

# install apache
# solve the dependentce an
for package in autoconf automake gcc gcc-c++ libtool libtool-devel;do
	rpm -qa | grep $package
	[ $? -ne 0 ] && yum install -y $package
done

# download httpd
releaseVer=`rpm -q centos-release|cut -d'-' -f3`
cd $tarDir
sleep 5
if [ $releaseVer -lt 7 ];then
	[ -s './httpd-2.2.32' ] && /bin/mv -bf httpd-2.2.32 /tmp/
	[ ! -f 'httpd-2.2.32.tar.bz2' ] && wget 'https://mirrors.aliyun.com/apache/httpd/httpd-2.2.32.tar.bz2'
    tar -jvxf httpd-2.2.32.tar.bz2 && cd httpd-2.2.32 || echo -e '\033[33m tar field\033[0m'
else
	[ -s './httpd-2.4.25' ] && /bin/mv -bf httpd-2.4.25 /tmp/ 
	[ ! -f 'httpd-2.4.25.tar.bz2' ] && wget 'https://mirrors.aliyun.com/apache/httpd/httpd-2.4.25.tar.bz2'
	tar -jvxf http-2.4.25.tar.bz2
	[ -d 'http-2.4.25' ] && cd http-2.4.25 || echo -e '\033[33m http-2.4.25 does not exit[0m'
fi

./configure --prefix=$installDir --sysconfdir=$confDir
make && make instal

# test apache service
${installDir}bin/apachectl start
netstat -tnlp | grep 80 && echo -e '\033[32m apache has started successful\033[0m' || {echo -e '\033[\033[33m apache started field 0m' && exit }

# add http as system service
cat >> /etc/init.d/httpd <<EOF
#!/bin/sh
#chkconfig 2345 10 90
#description: Activates/Deactivates Apache Web Server
EOF
cat ${installDir}bin/apachectl >> /etc/init.d/httpd && chkconfig --add httpd && chkconfig httpd on

