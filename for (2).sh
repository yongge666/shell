#/*************************************************************************
#    > File Name: for.sh
#    > Author: liyong
#    > Mail: 2550702985@qq.com
#    > Created Time: Tue 11 Apr 2017 02:13:05 AM CST
# ************************************************************************/
#!/bin/bash
for i in {1..10};do
	if [[ i -eq 5 ]] ;then
		echo pass..
	fi
	echo $i
done
