#!/bin/bash
path_log="request.log"
url1="http://www.google.com"
#code_success="200"

#get http response code
#http_code=$(curl -s -o /dev/null -I -w "%{http_code}" $url)

#if [ "$http_code"==$code_success ]; then

  curl $url1 > /dev/null
#else
  #echo "Status Code:$http_code, fail, Resquest URL: $url" >> $path_log
#fi