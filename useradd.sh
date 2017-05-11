#/*************************************************************************
#    > File Name: useradd.sh
#    > Author: liyong
#    > Mail: 2550702985@qq.com
#    > Description:Multi user created by the param admin input
#    > Created Time: Mon 17 Apr 2017 06:57:15 PM PDT
# ************************************************************************/
#!/bin/bash
read -p'please input the prefix of username,the default prefix is "test" :' name
${name:='test'}
[ "$name" == ' ' ] && ${name:='test'}
pwd='yongge666..'
class='class23'
mount=0
	while [ "$mount" -le 0 ];do
		read -p'please input the users of amounts:' mount
		echo $mount | grep -qE '^[[:digit:]]+$' || mount=0
		[ "$mount" -le 0 ]&&echo -e '\033[31m users amounts must greater than one \033[0m'
	done;

grep -q "^$class" /etc/group || groupadd $class 
	for((i=0;i<$mount;i++));do
	useradd -g $class  ${name}$i 2> /dev/null
	if [ ! "$?" -eq 0 ];then
        echo -n `date +'%F %T '`>>useradd-error.log && useradd -g class23 ${anme}$i 2>> useradd-error.log
	else
		echo $pwd | passwd  --stdin $name$i && chage -d 0 $name$i || echo -n `date +'%F %T '`>>useradd-error.log && echo $pwd|passwd --stdin $name$i 2>> useradd-error.log && echo "$name$i":"$pwd" >> useradd.log
	fi
done
