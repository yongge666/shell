#!/bin/bash
#/*************************************************************************
#    > File Name: file.sh
#    > Author: liyong
#    > Mail: 2550702985@qq.com
#    > Created Time: 2018-01-12 20:13
#    > Last modified: 2018-01-12 20:13
MAX_PID=$(top -b -n1|head  -8|tail -1|awk  '{print $2}')
ls -l /proc/$(top -b -n1|head  -8|tail -1|awk  '{print $2}')/fd/

