# -*- coding: UTF-8 -*-
import requests
import sys
from requests.auth import HTTPBasicAuth

file=sys.argv[1]
toPath=sys.argv[2]
username=sys.argv[3]
password=sys.argv[4]

print('上传文件：'+file+"  到  "+toPath)

files = open(file,'rb')
url = 'https://cloud.cia.yt/dav'+toPath
r = requests.put(url, files={"archive": files},auth = HTTPBasicAuth(username, password))
print('上传结果：'+r.text)