# coding:utf-8

#    __author__ = 'yongge'
#    __date__ = '2017/4/21'
#    __Desc__ =  测试测试  刷新自己的博客的浏览量

import urllib2,re,html5lib
from bs4 import BeautifulSoup

def getHtml(url,headers):
    req = urllib2.Request(url,headers=headers)
    page = urllib2.urlopen(req)
    html = page.read()
    return html

def parse(data):
    content = BeautifulSoup(data,'lxml')
    return content

def getReadNums(data,st):
    reg = re.compile(st)
    return re.findall(reg,data)

url = 'http://blog.csdn.net/yongge/article/details/'
headers = {
    'referer':'http://blog.csdn.net/',
    'User-Agent':'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36'
}

//获取帖子id列表
murl = 'http://blog.csdn.net/yonggeit/article/'
html = getHtml(murl,headers)
content = parse(html)
result = content.find_all('span',class_='link_title')
print result[0].get_text()

i = 0
while i<100000:
    n=random.uniform(1, 3)
    time.sleep(n)
    #number_list = [70154215,70191076,70175101,70249019,70230931]
    html = getHtml(url,headers)
    content = parse(html)
    result = content.find_all('span',class_='link_view')
    print result[0].get_text()
    i = i +1
