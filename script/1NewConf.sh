
#!/bin/bash


#获取/tmp/Advertise 下包含s42.qiuqiu 这个字符串的所有文件
LIST=`find /tmp/Advertise -name "*.conf" -print | xargs grep "s42.qiuqiu" | cut -d: -f1 | sort | uniq -c | awk '{print $2}'` 

#使用for循环遍历查找出来的所有文件（LIST这个变量）
  for I in ${LIST}; do
# （使用sed编辑器对文件里面s42.qiuqiu这个字符串进行替换，替换成新的s44.qiuqiu）
     sed -i 's/s42.qiuqiu/s44.qiuqiu/g' $I  
  done

# 如果全部替换完成则输出done 否则的话输出失败failure
  [ $? -eq 0 ] && echo "done."  || echo "failure."
