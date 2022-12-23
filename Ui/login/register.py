# -*- coding: utf-8 -*-
"""
@File    : register.py
@Author  : Shuaikang Zhou
@Time    : 2022/12/13 23:17
@IDE     : Pycharm
@Version : Python3.10
@comment : ···
"""
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from . import registerUi
from DB import data
import time


class registerControl(QWidget, registerUi.Ui_Dialog):
    loginSignal = pyqtSignal(str)

    def __init__(self, parent=None):
        super(registerControl, self).__init__(parent)
        self.setupUi(self)
        self.tips.setVisible(False)
        self.time.setVisible(False)
        self.setWindowTitle('WeChat')
        self.setWindowIcon(QIcon('./data/icon.png'))
        # self.register_2.clicked.connect(self.login_)
        self.set_avatar.clicked.connect(self.up_avatar)
        self.back.clicked.connect(self.btnEnterClicked)
        self.register_2.clicked.connect(self.register)
        self.avatar = None

    def up_avatar(self):
        path, _ = QFileDialog.getOpenFileName(self, 'Open file', r'..', "Image files (*.png;*.jpg)")
        if path:
            try:
                pixmap = QPixmap(path).scaled(80, 80)  # 按指定路径找到图片
                self.avatar_img.setPixmap(pixmap)  # 在label上显示图片
                self.avatar = path
            except:
                self.error.setText('头像不存在')

    def register(self):
        # self.close()
        username = self.username.text()
        password = self.password.text()
        nickname = self.nickname.text()
        flag = data.register(username, password,nickname)
        # print('123456')
        # print(flag)
        if not flag:
            self.error.setText('用户已存在')
            # print('yonghu已经存在')
        else:
            if not self.avatar:
                self.error.setText('请上传头像')
                return False
            self.error.setText('注册成功')
            self.error.setStyleSheet("color:black")
            avatar = data.get_avator(username)
            # new_path = '/'.join(avatar.split('/')[:-1])+'/'
            print(avatar)
            if '.' in avatar[-10:]:
                avatar = '.'.join(avatar.split('.')[:-1])
            print(avatar)
            data.mycopyfile(self.avatar, avatar + '.png')
            self.tips.setVisible(True)
            self.time.setVisible(True)
            self.thread = MyThread()  # 创建一个线程
            self.thread.sec_changed_signal.connect(self._update)  # 线程发过来的信号挂接到槽：update
            self.thread.start()

    def _update(self, sec):
        self.time.setProperty("value", float(sec))
        # self.time.setDigitCount(sec)
        # self.time.s
        if sec == 0:
            self.btnEnterClicked()

    def btnEnterClicked(self):
        print("enter clicked")
        # 中间可以添加处理逻辑
        self.loginSignal.emit("register")
        self.close()

    def btnExitClicked(self):
        print("Exit clicked")
        self.close()


class MyThread(QThread):
    sec_changed_signal = pyqtSignal(int)  # 信号类型：int

    def __init__(self, sec=1000, parent=None):
        super().__init__(parent)
        self.sec = 2  # 默认1000秒

    def run(self):
        for i in range(self.sec, -1, -1):
            self.sec_changed_signal.emit(i)  # 发射信号
            time.sleep(1)
