#/*************************************************************************
#    > File Name: checkUser.sh
#    > Author: liyong
#    > Mail: 2550702985@qq.com
#    > Created Time: Tue 11 Apr 2017 11:00:03 PM CST
# ************************************************************************/
#!/bin/bash
#参数判断
[[ $# -gt 0 ]]  &&([[ "$1" == "$USER" ]] && echo 'you are the current user'|| echo 'you are not the current user') ||echo -e '\033[36m 1 param needed  \033[0m' 
#存在性判断
#id $1 && [[ $1==$USER ]] && echo 'you are current user' || echo -e '\033[45m you are not current user\033[0m'
