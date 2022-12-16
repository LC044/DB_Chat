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
import hashlib
import os

import os
import shutil
from glob import glob

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


def avatar_md5(wxid):
    m = hashlib.md5()
    # 参数必须是byte类型，否则报Unicode-objects must be encoded before hashing错误
    m.update(bytes(wxid.encode('utf-8')))
    return m.hexdigest()


def get_avator(wxid):
    if wxid == None:
        return
    avatar = avatar_md5(wxid)
    avatar_path = r"./data/avatar/"
    path = avatar_path + avatar[:2] + '/' + avatar[2:4]
    for root, dirs, files in os.walk(path):
        for file in files:
            if avatar in file:
                avatar = file
                break
    return path + '/' + avatar


def mycopyfile(srcfile, dstpath):  # 复制函数
    if not os.path.isfile(srcfile):
        print("%s not exist!" % (srcfile))
    else:
        fpath, fname = os.path.split(srcfile)  # 分离文件名和路径
        dpath, dname = os.path.split(dstpath)
        if not os.path.exists(dpath):
            os.makedirs(dpath)  # 创建路径
        # dstpath = '/'.join(dstpath.split('/')[:-1])+'/'

        # print(dpath,dname)
        shutil.copy(srcfile, dpath)  # 复制文件
        os.rename(dpath + '/' + fname, dstpath)
        # print ("copy %s -> %s"%(srcfile, dstpath + fname))


username = '2020303457 or 1=1;'
password = '1234567'
# register('2020303457', '12345678')
r = login(username, password)
print(r)
path = get_avator('2020303457')
print(path)
mycopyfile('../data/icon.png', '../data/00/1.png')
