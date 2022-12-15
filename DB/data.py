# -*- coding: utf-8 -*-
"""
@File    : data.py
@Author  : Shuaikang Zhou
@Time    : 2022/12/13 20:59
@IDE     : Pycharm
@Version : Python3.10
@comment : ···
"""
import pymysql
import random
import time

# 打开数据库连接t
db = pymysql.connect(host='localhost',
                     user='root',
                     password='ZSK863854',
                     database='chat')
cursor = db.cursor()


def register(username, password):
    try:
        create = 'insert into users (username,password,c_time) values (%s,%s,%s)'
        timestmp = float(time.time())
        cursor.execute(create, [username, password, timestmp])
        db.commit()
    except pymysql.err.IntegrityError:
        print('用户已存在')
        return False
    return True


def login(username, password):
    select = 'select * from users where username = %s and password = %s'
    cursor.execute(select, [username, password])
    result = cursor.fetchall()
    if result:
        return True
    return False


username = '2020303457 or 1=1;'
password = '1234567'
# register('2020303457', '12345678')
r = login(username, password)
print(r)
