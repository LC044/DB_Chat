# -*- coding: utf-8 -*-
"""
@File    : chat.py
@Author  : Shuaikang Zhou
@Time    : 2022/12/13 15:07
@IDE     : Pycharm
@Version : Python3.10
@comment : ···
"""
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from .chatUi import *
from DB import data


class MainWinController(QMainWindow, Ui_Dialog):
    exitSignal = pyqtSignal()
    username = ''

    def __init__(self, parent=None):
        super(MainWinController, self).__init__(parent)
        self.setupUi(self)
        self.setWindowTitle('WeChat')
        self.setWindowIcon(QIcon('./data/icon.png'))
        self.pushButton.clicked.connect(self.btnEnterClicked)
        # self.showAvatar('./data/icon.png')
        self.myAvator = data.get_avator(self.username)
        self.show_avator(self.myAvator, self.myavatar)

        self.addContact()

    def show_avator(self, path, label):
        pixmap = QPixmap(path).scaled(60, 60)  # 按指定路径找到图片
        label.setPixmap(pixmap)  # 在label上显示图片

    def showAvatar(self, path, contact):
        pixmap = QPixmap(path).scaled(60, 60)  # 按指定路径找到图片
        contact.image1.setPixmap(pixmap)  # 在label上显示图片

    def btnEnterClicked(self):
        print("enter clicked")
        self.exitSignal.emit()
        self.close()

    def addContact(self):
        self.contact = []
        for i in range(5):
            # pushButton_2 = QtWidgets.QPushButton(self)
            pushButton_2 = Contact(self, i)
            pushButton_2.setGeometry(QtCore.QRect(160, 50 + i * 80, 300, 80))
            pushButton_2.setLayoutDirection(QtCore.Qt.LeftToRight)
            # pushButton_2.setLayout(self.gridLayout1)
            self.showAvatar('./data/icon.png', pushButton_2)
            self.contact.append(pushButton_2)

    def closeEvent(self, a0: QtGui.QCloseEvent) -> None:
        print("closed")
        self.exitSignal.emit()
        self.close()


class Contact(QtWidgets.QPushButton):
    def __init__(self, Ui, id=None):
        super(Contact, self).__init__(Ui)
        self.layoutWidget = QtWidgets.QWidget(Ui)
        self.layoutWidget.setObjectName("layoutWidget")
        self.gridLayout1 = QtWidgets.QGridLayout(self.layoutWidget)
        self.gridLayout1.setSizeConstraint(QtWidgets.QLayout.SetMaximumSize)
        self.gridLayout1.setContentsMargins(10, 10, 10, 10)
        self.gridLayout1.setHorizontalSpacing(20)
        self.gridLayout1.setVerticalSpacing(10)
        self.gridLayout1.setObjectName("gridLayout1")
        self.time0_1 = QtWidgets.QLabel(self.layoutWidget)
        font = QtGui.QFont()
        font.setPointSize(8)
        self.time0_1.setFont(font)
        self.time0_1.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.time0_1.setAlignment(QtCore.Qt.AlignRight | QtCore.Qt.AlignTrailing | QtCore.Qt.AlignVCenter)
        self.time0_1.setObjectName("time0_1")
        self.gridLayout1.addWidget(self.time0_1, 0, 2, 1, 1)
        self.remark1 = QtWidgets.QLabel(self.layoutWidget)
        font = QtGui.QFont()
        font.setPointSize(15)
        self.remark1.setFont(font)
        self.remark1.setObjectName("remark1")
        self.gridLayout1.addWidget(self.remark1, 0, 1, 1, 1)
        self.msg1 = QtWidgets.QLabel(self.layoutWidget)
        font = QtGui.QFont()
        font.setPointSize(8)
        self.msg1.setFont(font)
        self.msg1.setObjectName("msg1")
        self.gridLayout1.addWidget(self.msg1, 1, 1, 1, 2)
        self.image1 = QtWidgets.QLabel(self.layoutWidget)
        self.image1.setMinimumSize(QtCore.QSize(60, 60))
        self.image1.setMaximumSize(QtCore.QSize(60, 60))
        self.image1.setLayoutDirection(QtCore.Qt.RightToLeft)
        self.image1.setAutoFillBackground(False)
        self.image1.setStyleSheet("background-color: #ffffff;")
        self.image1.setInputMethodHints(QtCore.Qt.ImhNone)
        self.image1.setFrameShape(QtWidgets.QFrame.NoFrame)
        self.image1.setFrameShadow(QtWidgets.QFrame.Plain)
        self.image1.setAlignment(QtCore.Qt.AlignLeading | QtCore.Qt.AlignLeft | QtCore.Qt.AlignVCenter)
        self.image1.setObjectName("image1")
        self.gridLayout1.addWidget(self.image1, 0, 0, 2, 1)
        self.gridLayout1.setColumnStretch(0, 1)
        self.gridLayout1.setColumnStretch(1, 6)
        self.gridLayout1.setRowStretch(0, 5)
        self.gridLayout1.setRowStretch(1, 3)
        self.setLayout(self.gridLayout1)
        if id:
            self.show_info(id)

    def show_info(self, id):
        try:
            avatar = id
            remark = id
            time = id
            msg = id
            pixmap = QPixmap(avatar).scaled(60, 60)  # 按指定路径找到图片
            self.image1.setPixmap(pixmap)  # 在label上显示图片
            self.remark1.setText(remark)
            self.time0_1.setText(time)
            self.msg1.setText(msg)
        except:
            pixmap = QPixmap('./data/icon.png').scaled(60, 60)  # 按指定路径找到图片
            self.image1.setPixmap(pixmap)  # 在label上显示图片
            self.remark1.setText('remark')
            self.time0_1.setText('2022/01/01')
            self.msg1.setText('------')
