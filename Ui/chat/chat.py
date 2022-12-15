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


class MainWinController(QMainWindow, Ui_Dialog):
    exitSignal = pyqtSignal()

    def __init__(self, parent=None):
        super(MainWinController, self).__init__(parent)
        self.setupUi(self)
        self.setWindowTitle('WeChat')
        self.setWindowIcon(QIcon('./data/icon.png'))
        self.pushButton.clicked.connect(self.btnEnterClicked)

    def btnEnterClicked(self):
        print("enter clicked")
        self.exitSignal.emit()
        self.close()
    def closeEvent(self, a0: QtGui.QCloseEvent) -> None:
        print("closed")
        self.exitSignal.emit()
        self.close()
