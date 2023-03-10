from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from PyQt5.QtGui import *
import sys
from Ui import *


class ViewController:
    def loadLoginView(self):
        """
        登录界面
        :return:
        """
        self.viewlogin = login.loginControl()  # 需要将viewlogin设为成员变量
        self.viewlogin.loginSignal.connect(self.loadMainWinView)
        self.viewlogin.registerSignal.connect(self.loadRegisterView)
        self.viewlogin.show()

    def loadRegisterView(self):
        """
        注册界面
        :return:
        """
        self.viewlogin = register.registerControl()  # 需要将viewlogin设为成员变量
        self.viewlogin.loginSignal.connect(self.loadLoginView)
        self.viewlogin.show()


    def loadMainWinView(self, username):
        """
        聊天界面
        :param username: 账号
        :return:
        """
        self.viewMainWIn = chat.MainWinController(username=username)
        self.viewMainWIn.setWindowTitle("Chat")
        # print(username)
        self.viewMainWIn.username = username
        self.viewMainWIn.exitSignal.connect(self.loadLoginView)  # 不需要回到登录界面可以省略
        self.viewMainWIn.show()
        # self.viewMainWIn.signUp()


if __name__ == '__main__':
    app = QApplication(sys.argv)
    view = ViewController()
    view.loadLoginView()  # 进入登录界面，如果viewlogin不是成员变量，则离开作用域后失效。
    # view.loadMainWinView('102')
    sys.exit(app.exec_())
