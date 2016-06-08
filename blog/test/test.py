# -*- coding: utf-8 -*- 
import requests
import demjson

user={'username':"huangmengzhou",
'nickname':u"黄孟州",
'password':"admin",
'comment':u"备份"}

requests.post("/admin/users/")