#/*************************************************************************
#    > File Name: sysyteminfo.sh
#    > Author: liyong
#    > Mail: 2550702985@qq.com
#    > Created Time: Tue 11 Apr 2017 05:22:30 PM CST
# ************************************************************************/
#!/bin/bash
echo -e "\033[35m主机名:\033[0m \033[36m `hostname`\033[0m"
sleep 2
echo -e "\033[35m系统版本:\033[0m \033[36m `uname -r`\033[0m"
sleep 1
echo -e "\033[35mipv4地址:\033[0m \033[36m `ifconfig|grep -w inet|head -1|tr -s ' '|cut -d' ' -f3`\033[0m"
echo -e "\033[35m内核版本:\033[0m \033[36m `cat /etc/redhat-release`\033[0m"
sleep 1
echo -e "\033[35mCPU型号:\033[0m \033[36m `lscpu| grep 'Model name'|cut -d: -f2|tr -s ' '`\033[0m"
sleep 1.5
echo -e "\033[35m硬盘空间:\033[0m \033[36m \n`df -h|grep -v 'tmpfs'`\033[0m"
sleep 1.5
echo -e "\033[35m内存大小:\033[0m \033[36m `free `\033[0m"
