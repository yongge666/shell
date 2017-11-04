#/*************************************************************************
#    > File Name: manpage.sh
#    > Author: liyong
#    > Mail: 2550702985@qq.com
#    > Created Time: 2017-07-19 12:55
#    > Last modified: 2017-07-19 12:55
wget http://pkgs.fedoraproject.org/repo/pkgs/man-pages-zh-CN/manpages-zh-1.5.1.tar.gz/13275fd039de8788b15151c896150bc4/manpages-zh-1.5.1.tar.gz
tar zxvf manpages-zh-1.5.1.tar.gz
cd manpages-zh-1.5.1
./configure --prefix=/usr/local/zhman --disable-zhtw  
make && make install
cd ~
echo 'alias cman="man -M /usr/local/zhman/share/man/zh_CN"'>>.bash_profile
source .bash_profile
