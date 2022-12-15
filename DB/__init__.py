# -*- coding: utf-8 -*-
"""
@File    : __init__.py
@Author  : Shuaikang Zhou
@Time    : 2022/12/13 20:48
@IDE     : Pycharm
@Version : Python3.10
@comment : ···
"""
import pymysql
import random

# 打开数据库连接t
db = pymysql.connect(host='localhost',
                     user='root',
                     password='ZSK863854',
                     database='chat')
cursor = db.cursor()
cursor.execute("select * from users")
rows = cursor.fetchall()
for row in rows:
    print(row)
# cursor.execute(sql)
# db.commit()