#/*************************************************************************
#    > File Name: createUser.sh
#    > Author: liyong
#    > Mail: 2550702985@qq.com
#    > Created Time: Tue 11 Apr 2017 03:40:09 AM CST
# ************************************************************************/
#!/bin/bash
[[ $# -ne 1 ]] && echo 'check your param!' && exit 2
id $1 && ( useradd $1 && echo '111' |  passwd --stdin $1 && chage -d 0 $1) || echo "User $1 has been exits"
