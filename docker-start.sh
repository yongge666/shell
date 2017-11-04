#/*************************************************************************
#    > File Name: docker-start.sh
#    > Author: liyong
#    > Mail: 2550702985@qq.com
#    > Created Time: 2017-07-23 15:54
#    > Last modified: 2017-07-23 15:54
PID=$(docker inspect format "{{.State.pid}}"$1)
nsenter -t $PID -u -i -p
