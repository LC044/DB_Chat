# -*- coding: utf-8 -*-
"""
@File    : login.py
@Author  : Shuaikang Zhou
@Time    : 2022/12/13 15:01
@IDE     : Pycharm
@Version : Python3.10
@comment : ···
"""
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from . import loginUi
from DB import data


class loginControl(QWidget, loginUi.Ui_Dialog):
    loginSignal = pyqtSignal(str)
    registerSignal = pyqtSignal(str)

    def __init__(self, parent=None):
        super(loginControl, self).__init__(parent)
        self.setupUi(self)
        self.setWindowTitle('WeChat')
        self.setWindowIcon(QIcon('./data/icon.png'))
        self.login.clicked.connect(self.login_)
        self.register_2.clicked.connect(self.register)

    def login_(self):
        username = self.username.text()
        password = self.password.text()
        flag = data.login(username,password)
        if flag:
            self.btnEnterClicked(username)
        else:
            self.error.setText('密码错误')
            # self.error.se
            print('密码错误')

    def register(self):
        self.registerSignal.emit('register')
        self.close()
        # data.register(username, password)

    def btnEnterClicked(self,username):
        print("enter clicked")

        # 中间可以添加处理逻辑

        self.loginSignal.emit(username)
        self.close()

    def btnExitClicked(self):
        print("Exit clicked")
        self.close()
