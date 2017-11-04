#/*************************************************************************
#    > File Name: setPath.sh
#    > Author: liyong
#    > Mail: 2550702985@qq
#    > Created Time: Sat 06 May 2017 02:16:26 AM CST
#    > Usage put this file on 
# ************************************************************************/
#!/bin/bash
PATH=$PATH:/root/bin
#set default editor
export EDITOR=vim
# alias
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias cdnet='cd /etc/sysconfig/network-scripts/'
alias vimeth0='vim /etc/sysconfig/network-scripts/ifcfg-eth0'
alias vimeth1='vim /etc/sysconfig/network-scripts/ifcfg-eth1'
alias vimeth2='vim /etc/sysconfig/network-scripts/ifcfg-eth2'
os=6
serviceList='httpd vsftpd mysqld iptables smb'
grep '7.' /etc/redhat-release &> /dev/null && os=7
function serviceRestartAlias(){
    [ "$os" -eq 6 ] && alias r$1="service $1 restart" || alias r$1="systemctl restart $1"
}
for i in $serviceList
do
	serviceRestartAlias $i
done

# set network service restart alias
[ "$os" -eq 6 ] && alias rnet='service network restart' || alias rnet='systemctl restart NetworkManager'

#set PSI
export PS1="\[\033[40;33;1m\][\!]\`if [[ \$?   = "0" ]]; then echo "\\[\\033[32m\\]"; else echo   "\\[\\033[31m\\]"; fi\`[\u@\h: \`if [[ `pwd|wc -c|tr -d "   "` > 18 ]]; then echo "\\W"    ; else echo "\\w";   fi\`]\\$\[\033[0m\] "; echo -ne "\033]0;`hostname   -s`:`pwd`\007"