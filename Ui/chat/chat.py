# -*- coding: utf-8 -*-
"""
@File    : chat.py
@Author  : Shuaikang Zhou
@Time    : 2022/12/13 15:07
@IDE     : Pycharm
@Version : Python3.10
@comment : ···
"""
import socket  # 导入socket模块
import datetime
import json

from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from .chatUi import *
from DB import data
from .addContact.addContact import addControl
from .group.Group import GroupControl
from .userinfo.userinfoUi import Ui_Frame as coninfoUi
from .myinfo.myinfo import InfoControl


# from PyQt5.QtWebEngineWidgets import QWebEngineView
class Me:
    """个人信息"""

    def __init__(self, username):
        self.username = username
        self.username = username  # 自己的用户名
        self.status = data.online(username, socket)  # 在线状态，即dup端口号
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        address = ("localhost", self.status)
        print('自己端口：', self.status)
        self.socket.bind(address)  # 为服务器绑定一个固定的地址，ip和端口
        data.tell_online(username, self.socket)
        self.my_avatar = data.get_avator(self.username)  # 自己的头像地址
        # self.my_avatar = data.get_avator(self.username)  # 自己的头像地址


class MainWinController(QMainWindow, Ui_Dialog):
    exitSignal = pyqtSignal()

    # username = ''

    def __init__(self, username, parent=None):
        super(MainWinController, self).__init__(parent)
        self.setupUi(self)
        self.setWindowTitle('WeChat')
        self.setWindowIcon(QIcon('./data/icon.png'))
        self.initui()
        self.Me = Me(username)
        self.GroupView = GroupControl(parent=self.frame_3, Me=self.Me)
        self.GroupView.setVisible(False)
        self.MyInfoUi = InfoControl(parent=self.frame_3, Me=self.Me)
        self.MyInfoUi.setVisible(False)
        # self.frame = QtWidgets.QFrame(self.frame_2)
        # self.frame.setGeometry(QtCore.QRect(321, 0, 801, 720))
        self.frame_coninfo = QtWidgets.QFrame(self.frame_2)
        self.frame_coninfo.setGeometry(QtCore.QRect(321, 0, 800, 720))
        self.frame_coninfo.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.frame_coninfo.setFrameShadow(QtWidgets.QFrame.Raised)
        self.frame_coninfo.setObjectName("frame_coninfo")
        self.frame_coninfo.setVisible(False)
        self.coninfoUi = coninfoUi()
        self.coninfoUi.setupUi(self.frame_coninfo)
        self.coninfoUi.btn_update_remark.clicked.connect(self.update_conRemark)
        self.coninfoUi.btn_delete_contact.clicked.connect(self.delete_contact)
        self.sign_up.clicked.connect(self.signUp)  # 退出登录按钮
        self.btn_addC.clicked.connect(self.add_contact)  # 添加联系人按钮
        self.btn_sendMsg.clicked.connect(self.sendMsg)  # 发送信息按钮
        self.btn_chat.clicked.connect(self.showChat)  # 聊天按钮
        self.btn_add_group.clicked.connect(self.groupChat)
        self.btn_contact.clicked.connect(self.showContact)
        self.btn_update_myinfo.clicked.connect(self.myInfo)
        self.btn_destroy.clicked.connect(self.destroy_me)
        self.btn_about.clicked.connect(self.about)
        # self.showAvatar('./data/icon.png')
        self.contacts = {}
        self.show_avator(self.Me.my_avatar, self.myavatar)  # 显示自己头像
        # self.showContact()  # 显示联系人
        self.now_btn = self.btn_chat
        self.last_btn = None
        self.chat_flag = True
        self.showChat()
        self.ta_username = None
        self.last_msg_time = datetime.datetime(2022, 12, 19, 15, 4)  # 上次信息的时间
        self.last_talkerId = None
        self.now_talkerId = None

        self.recvThread = recvThread(username, self.Me.socket)  # 创建新的线程用于接收消息
        self.recvThread.recv_userSignal.connect(
            self.showMsg)  # 接收到的消息与显示消息函数绑定
        self.recvThread.online_signal.connect(self.Chat)
        self.recvThread.recv_groupSignal.connect(self.GroupView.showMsg)
        self.recvThread.start()

    def initui(self):
        self.textEdit = myTextEdit(self.frame)
        self.textEdit.setGeometry(QtCore.QRect(9, 580, 821, 141))
        font = QtGui.QFont()
        font.setPointSize(15)
        self.textEdit.setFont(font)
        self.textEdit.setTabStopWidth(80)
        self.textEdit.setCursorWidth(1)
        self.textEdit.setObjectName("textEdit")
        self.textEdit.sendSignal.connect(self.sendMsg)
        self.btn_sendMsg = QtWidgets.QPushButton(self.frame)
        self.btn_sendMsg.setGeometry(QtCore.QRect(680, 670, 121, 51))
        font = QtGui.QFont()
        font.setFamily("黑体")
        font.setPointSize(15)
        font.setBold(False)
        font.setWeight(50)
        self.btn_sendMsg.setFont(font)
        self.btn_sendMsg.setCursor(QtGui.QCursor(QtCore.Qt.ArrowCursor))
        self.btn_sendMsg.setMouseTracking(False)
        self.btn_sendMsg.setAutoFillBackground(False)
        self.btn_sendMsg.setStyleSheet("QPushButton {background-color: #f0f0f0;\n"
                                       "padding: 10px;\n"
                                       "color:rgb(5,180,104);}\n"
                                       "QPushButton:hover{background-color: rgb(198,198,198)}\n"
                                       )
        self.btn_sendMsg.setIconSize(QtCore.QSize(40, 40))
        self.btn_sendMsg.setCheckable(False)
        self.btn_sendMsg.setAutoDefault(True)
        self.btn_sendMsg.setObjectName("btn_sendMsg")
        _translate = QtCore.QCoreApplication.translate
        self.btn_sendMsg.setText(_translate("Dialog", "发送"))
        self.btn_sendMsg.setToolTip('按Enter键发送，按Ctrl+Enter键换行')

    def showChat(self):
        """
        显示聊天界面
        :return:
        """
        self.frame_2.setVisible(True)
        self.GroupView.setVisible(False)
        self.MyInfoUi.setVisible(False)
        self.frame_coninfo.setVisible(False)
        self.frame.setVisible(True)
        self.now_btn = self.btn_chat
        self.now_btn.setStyleSheet(
            "QPushButton {background-color: rgb(198,198,198);}")
        if self.last_btn and self.last_btn != self.now_btn:
            self.last_btn.setStyleSheet("QPushButton {background-color: rgb(240,240,240);}"
                                        "QPushButton:hover{background-color: rgb(209,209,209);}\n")
        self.last_btn = self.btn_chat
        self.chat_flag = True
        contacts = data.get_contacts(self.Me.username)
        print(contacts)
        self.contacts_num = len(contacts)
        max_hight = max(len(contacts) * 80, 680)
        self.scrollAreaWidgetContents.setGeometry(
            QtCore.QRect(0, 0, 300, max_hight))
        for i in range(len(contacts)):
            contact = contacts[i]
            # print(contact)
            talkerId = contact[0]
            conRemark = contact[1]
            if talkerId in self.contacts.keys():
                print(conRemark)
                self.contacts[talkerId].remark1.setText(conRemark)
                continue
            print('联系人：', i, contact)
            pushButton_2 = Contact(self.scrollAreaWidgetContents, i, contact)
            pushButton_2.setGeometry(QtCore.QRect(0, 80 * i, 300, 80))
            pushButton_2.setLayoutDirection(QtCore.Qt.LeftToRight)
            pushButton_2.clicked.connect(pushButton_2.show_msg)
            pushButton_2.usernameSingal.connect(self.Chat)
            self.contacts[talkerId] = pushButton_2

    def showContact(self):
        """
        显示联系人
        :return:
        """
        self.frame_2.setVisible(True)
        self.GroupView.setVisible(False)
        self.MyInfoUi.setVisible(False)
        self.frame_coninfo.setVisible(False)
        self.frame.setVisible(False)
        self.now_btn = self.btn_contact
        self.now_btn.setStyleSheet(
            "QPushButton {background-color: rgb(198,198,198);}")
        if self.last_btn and self.last_btn != self.now_btn:
            self.last_btn.setStyleSheet("QPushButton {background-color: rgb(240,240,240);}"
                                        "QPushButton:hover{background-color: rgb(209,209,209);}\n")
        self.last_btn = self.btn_contact
        # self.contacts = {}
        self.chat_flag = False

    def show_avator(self, path, label):
        """显示头像"""
        print(self.Me.username)
        print(path)

        pixmap = QPixmap(path).scaled(100, 100)  # 按指定路径找到图片
        # pixmap = QPixmap(100,100)
        pixmap.scaled(100, 100)
        # # pixmap.
        # painter = QPainter(pixmap)
        # pen = QPen(Qt.red, 10)
        # painter.setPen(pen)
        # # painter.drawRect(0,0,20,20)
        # painter.drawEllipse(80, 50, 10, 10)
        # # painter.drawPixmap(80,80,pixmap)
        # painter.end()
        label.setPixmap(pixmap)  # 在label上显示图片

    def add_contact(self):  # 添加联系人
        # self.frame.setVisible(False)
        self.now_btn = self.btn_addC
        self.now_btn.setStyleSheet(
            "QPushButton {background-color: rgb(198,198,198);}")
        if self.last_btn and self.last_btn != self.now_btn:
            self.last_btn.setStyleSheet("QPushButton {background-color: rgb(240,240,240);}"
                                        "QPushButton:hover{background-color: rgb(209,209,209);}\n")
        self.last_btn = self.btn_addC
        self.frame_2.setVisible(False)
        self.GroupView.setVisible(False)
        self.addControlView = addControl(self.Me.username)
        self.addControlView.contactSignal.connect(self.new_contactUi)
        self.addControlView.show()
        # addControlView.exec_()

    def groupChat(self):
        """显示群组聊天界面"""
        self.frame_2.setVisible(False)
        # self.frame_4.setVisible(True)
        self.GroupView.setVisible(True)
        self.MyInfoUi.setVisible(False)
        self.now_btn = self.btn_add_group
        self.now_btn.setStyleSheet(
            "QPushButton {background-color: rgb(198,198,198);}")
        if self.last_btn and self.last_btn != self.now_btn:
            self.last_btn.setStyleSheet("QPushButton {background-color: rgb(240,240,240);}"
                                        "QPushButton:hover{background-color: rgb(209,209,209);}\n")
        self.last_btn = self.btn_add_group
        # self.GroupView.initUi()

    def myInfo(self):
        """显示我的个人信息"""
        self.now_btn = self.btn_update_myinfo
        self.now_btn.setStyleSheet(
            "QPushButton {background-color: rgb(198,198,198);}"
        )  # 当前按钮设置为灰色
        if self.last_btn and self.last_btn != self.now_btn:
            self.last_btn.setStyleSheet(
                "QPushButton {background-color: rgb(240,240,240);}"
                "QPushButton:hover{background-color: rgb(209,209,209);}\n"
            )  # 上一个按钮设置为白色
        self.last_btn = self.btn_update_myinfo
        self.frame_2.setVisible(False)
        # self.frame_4.setVisible(True)
        self.GroupView.setVisible(False)
        self.MyInfoUi.setVisible(True)
        self.MyInfoUi.initUi()

    def new_contactUi(self, contact):
        """每添加一个联系人在UI界面上显示出来"""
        talkerId = contact[0]
        self.contacts_num += 1
        max_hight = max((self.contacts_num) * 80, 680)
        self.scrollAreaWidgetContents.setGeometry(
            QtCore.QRect(0, 0, 300, max_hight))
        pushButton_2 = Contact(
            self.scrollAreaWidgetContents, self.contacts_num, contact)
        pushButton_2.setGeometry(QtCore.QRect(
            0, 80 * self.contacts_num - 80, 300, 80))
        pushButton_2.setLayoutDirection(QtCore.Qt.LeftToRight)
        pushButton_2.clicked.connect(pushButton_2.show_msg)
        pushButton_2.usernameSingal.connect(self.Chat)
        self.contacts[talkerId] = pushButton_2

    def showAvatar(self, path, contact):
        pixmap = QPixmap(path).scaled(60, 60)  # 按指定路径找到图片
        contact.image1.setPixmap(pixmap)  # 在label上显示图片

    def signUp(self):
        """
        退出登录，将状态设置为离线
        :return:
        """
        data.offline(self.Me.username)
        print("enter clicked")
        self.exitSignal.emit()
        self.close()

    def contactInfo(self, contactId):
        """
        显示联系人信息
        :param contactId:
        :return:
        """
        self.GroupView.setVisible(False)
        self.frame.setVisible(False)
        self.frame_2.setVisible(True)
        self.frame_coninfo.setVisible(True)
        self.ta_username = contactId
        conRemark = data.get_remark(self.Me.username, contactId)
        nickname = data.get_nickname(contactId)
        self.coninfoUi.l_nickname.setText(f'昵称：{nickname}')
        self.coninfoUi.l_remark.setText(conRemark)
        self.coninfoUi.l_username.setText(f'账号：{contactId}')
        acatar = data.get_avator(contactId)
        pixmap = QPixmap(acatar).scaled(80, 80)  # 按指定路径找到图片
        self.coninfoUi.l_avatar.setPixmap(pixmap)  # 在label上显示图片
        self.coninfoUi.lineEdit.setText(conRemark)
        # 编辑框聚焦
        self.coninfoUi.lineEdit.setFocus()

    def update_conRemark(self):
        """
        修改备注名
        :return:
        """
        conRemark = self.coninfoUi.lineEdit.text()
        data.update_conRemark(self.Me.username, self.ta_username, conRemark)
        self.contacts[self.ta_username].remark1.setText(conRemark)
        self.contactInfo(self.ta_username)

    def delete_contact(self):
        """
        删除联系人
        :return:
        """
        a = QMessageBox.question(self, '警告', '删除好友之后将删除与其聊天记录\n你确定要继续吗?', QMessageBox.Yes | QMessageBox.No,
                                 QMessageBox.No)  # "退出"代表的是弹出框的标题,"你确认退出.."表示弹出框的内容
        if a == QMessageBox.Yes:
            data.delete_contact(self.Me.username, self.ta_username)
            var = self.contacts[self.ta_username].setVisible(False)
            self.contacts.pop(self.ta_username)
            self.contacts_num -= 1
            self.last_talkerId = None
            # self.contacts[self.ta_username]=None
            self.showContact()
        else:
            return

    def Chat(self, talkerId):
        """
        聊天界面 点击联系人头像时候显示聊天数据
        :param talkerId:
        :return:
        """
        self.now_talkerId = talkerId
        status = data.check_online(talkerId)
        if status == -1:
            # pass
            self.contacts[talkerId].msg1.setText('离线')
        else:
            self.contacts[talkerId].msg1.setText('在线')
        # 把当前按钮设置为灰色
        if self.last_talkerId and self.last_talkerId != talkerId:
            print('对方账号：', self.last_talkerId)
            self.contacts[self.last_talkerId].setStyleSheet(
                "QPushButton {background-color: rgb(253,253,253);}"
                "QPushButton:hover{background-color: rgb(209,209,209);}\n"
            )
        self.last_talkerId = talkerId
        self.contacts[talkerId].setStyleSheet(
            "QPushButton {background-color: rgb(198,198,198);}"
            "QPushButton:hover{background-color: rgb(209,209,209);}\n"
        )
        # "background-color : rgb(198,198,198)""QPushButton:hover{}\n")
        if not self.chat_flag:
            return self.contactInfo(talkerId)
        self.frame.setVisible(True)
        self.frame_2.setVisible(True)
        self.frame_coninfo.setVisible(False)
        self.GroupView.setVisible(False)
        self.MyInfoUi.setVisible(False)
        conRemark = data.get_remark(self.Me.username, talkerId)
        self.label_remark.setText(conRemark)
        self.message.clear()
        self.message.append(talkerId)
        self.ta_username = talkerId
        self.ta_avatar = data.get_avator(talkerId)
        self.textEdit.setFocus()
        # 创建新的线程用于显示聊天记录
        self.Thread = ChatMsg(self.Me.username, talkerId, self.Me.socket)
        self.Thread.isSend_signal.connect(self.showMsg)
        self.Thread.recvSignal.connect(self.showMsg)
        self.Thread.sendSignal.connect(self.showMsg)
        self.Thread.start()

    def closeEvent(self, a0: QtGui.QCloseEvent) -> None:
        print("closed")
        self.exitSignal.emit()
        self.close()

    def sendMsg(self, msg):
        """
        发送信息
        :param msg:信息内容
        :return:
        """
        msg = self.textEdit.toPlainText()
        message = self.Thread.send_msg(msg)
        if message == -1:
            print(msg, '发送失败')
            QMessageBox.critical(self, "错误", "对方不在线")
            # self.showMsg(message)
        else:
            print(msg, '发送成功')
        self.textEdit.clear()

    def check_time(self, msg_time):
        """
        判断两次聊天时间是否大于五分钟
        超过五分钟就显示时间
        :param msg_time:
        :return:
        """
        dt = msg_time - self.last_msg_time
        # print(msg_time)
        if dt.seconds >= 300:
            html = '''
            <table align="center" style="vertical-align: middle;">
        	<tbody>
        		<tr>
        			<td>%s</td>
        		</tr> 
        	</tbody>
        </table>''' % (msg_time.strftime("%Y-%m-%d %H:%M"))
            # print(html)
            self.last_msg_time = msg_time
            self.message.insertHtml(html)

    def showMsg(self, message):
        """
        显示聊天消息
        :param message:
        :return:
        """
        ta_username = message[5]
        if self.ta_username is None or ta_username != self.ta_username:
            return
        isSend = message[2]
        content = message[4]
        msg_time = message[3]
        self.check_time(msg_time)
        if isSend == 1:
            # 自己发的信息在右边显示
            self.right(content)
        else:
            # 收到的信息在左边显示
            self.left(content)
        self.message.moveCursor(self.message.textCursor().End)

    def right(self, content):
        html = '''
            <div>
            <table align="right" style="vertical-align: middle;">
        	<tbody>
        		<tr>
        			<td>%s :</td>
        			<td style="border: 1px #000000 solid"><img align="right" src="%s" width="45" height="45"/></td>
        			<td width="15"></td>
        		</tr>
        	</tbody>
        </table>
        </div>
        ''' % (content, self.Me.my_avatar)
        self.message.insertHtml(html)

    def left(self, content):
        html = '''
        <div>
                   <table align="left" style="vertical-align: middle;">
                	<tbody>
                		<tr>
                		    <td width="15"></td>
                			<td style="border: 1px #000000 solid"><img align="right" src="%s" width="45" height="45"/></td>
                			<td>: %s</td>
                		</tr>
                	</tbody>
                </table>
                </div>
                ''' % (self.ta_avatar, content)
        self.message.insertHtml(html)

    def destroy_me(self):
        """注销账户"""
        a = QMessageBox.question(self, '注销', '注销之后将删除所有数据\n你确定要注销吗?', QMessageBox.Yes | QMessageBox.No,
                                 QMessageBox.No)  # "退出"代表的是弹出框的标题,"你确认退出.."表示弹出框的内容
        if a != QMessageBox.Yes:
            return
        data.del_user(self.Me.username)
        self.close()

    def about(self):
        QMessageBox.about(self, "关于",
                          "关于作者\n姓名：周帅康\n学号：2020303457"
                          )

    def __del__(self):
        data.offline(self.Me.username)


class recvThread(QThread):
    """
    接收消息线程
    """
    online_signal = pyqtSignal(str)
    recv_userSignal = pyqtSignal(tuple)
    recv_groupSignal = pyqtSignal(tuple)

    def __init__(self, my_u, socket, parent=None):
        super().__init__(parent)
        self.sec = 2  # 默认1000秒
        self.my_u = my_u
        self.my_avatar = data.get_avator(my_u)
        self.socket = socket

    def run(self):
        while True:
            receive_data, client = self.socket.recvfrom(1024)
            msg = receive_data.decode('utf-8')
            recvmsg = json.loads(msg)
            ta_username = recvmsg['username']
            content = recvmsg['content']
            _type = recvmsg['type']
            print('收到数据：', ta_username, content)
            if content == '在线0000_1':
                self.online_signal.emit(ta_username)
                continue
            if _type == 'U':
                dt = datetime.datetime.now()
                message = (
                    0, 3, 0, dt, content, ta_username
                )
                data.send_msg(
                    IsSend=0,
                    msg=content,
                    ta=ta_username,
                    me=self.my_u,
                    status=1,
                    _type=3,
                )
                self.recv_userSignal.emit(message)
            elif _type == 'G':
                gid = recvmsg['gid']
                message = (
                    1, gid, _type, content, datetime.datetime.now(), ta_username, 0
                )
                self.recv_groupSignal.emit(message)
                pass


class Contact(QtWidgets.QPushButton):
    """
    联系人类，继承自pyqt的按钮，里面封装了联系人头像等标签
    """
    usernameSingal = pyqtSignal(str)

    def __init__(self, Ui, id=None, contact=None):
        super(Contact, self).__init__(Ui)
        # self.pushButton_2 = QtWidgets.QPushButton(self.scrollAreaWidgetContents)
        # self.pushButton_2.setGeometry(QtCore.QRect(0, 0, 300, 80))
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
        self.time0_1.setAlignment(
            QtCore.Qt.AlignRight | QtCore.Qt.AlignTrailing | QtCore.Qt.AlignVCenter)
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
        self.image1.setAlignment(
            QtCore.Qt.AlignLeading | QtCore.Qt.AlignLeft | QtCore.Qt.AlignVCenter)
        self.image1.setObjectName("image1")
        self.gridLayout1.addWidget(self.image1, 0, 0, 2, 1)
        self.gridLayout1.setColumnStretch(0, 1)
        self.gridLayout1.setColumnStretch(1, 6)
        self.gridLayout1.setRowStretch(0, 5)
        self.gridLayout1.setRowStretch(1, 3)
        self.setLayout(self.gridLayout1)
        self.setStyleSheet(
            "QPushButton {background-color: rgb(253,253,253);}"
            "QPushButton:hover{background-color: rgb(209,209,209);}\n"
        )
        # if id:
        #     self.show_info(id)
        if contact:
            self.username = contact[0]
            self.conRemark = contact[1]
            self._type = contact[2]
            self.addTime = contact[3]
            self.show_info(id)

    def show_info(self, id):
        avatar = data.get_avator(self.username)
        remark = id
        time = datetime.datetime.now().strftime("%m-%d %H:%M")
        msg = '还没说话'
        pixmap = QPixmap(avatar).scaled(60, 60)  # 按指定路径找到图片
        self.image1.setPixmap(pixmap)  # 在label上显示图片
        self.remark1.setText(self.conRemark)
        if data.check_online(self.username) == -1:
            self.msg1.setText('(离线)  ' + msg)
        else:
            self.msg1.setText('(在线)  ' + msg)
        self.time0_1.setText(time)

    def show_msg(self):
        self.usernameSingal.emit(self.username)


class ChatMsg(QThread):
    """
    发送信息线程
    """
    isSend_signal = pyqtSignal(tuple)
    recvSignal = pyqtSignal(tuple)
    sendSignal = pyqtSignal(tuple)

    def __init__(self, my_u, ta_u, socket, parent=None):
        super().__init__(parent)
        self.sec = 2  # 默认1000秒
        self.my_u = my_u
        self.ta_u = ta_u
        self.my_avatar = data.get_avator(my_u)
        self.ta_avatar = data.get_avator(ta_u)
        self.socket = socket
        self.ta_port = data.check_online(ta_u)
        self.ta_addr = ('localhost', self.ta_port)
        print('对方地址：', self.ta_addr)

    def send_msg(self, msg):
        self.ta_port = data.check_online(self.ta_u)
        print('对方端口：', self.ta_port)
        self.ta_addr = ('localhost', self.ta_port)
        if self.ta_port == -1:
            print('对方不在线')
            return -1
        send_data = {
            'type': "U",
            'username': self.my_u,
            'content': msg
        }
        self.socket.sendto(json.dumps(send_data).encode('utf-8'), self.ta_addr)
        message = data.send_msg(
            IsSend=1,
            msg=msg,
            ta=self.ta_u,
            me=self.my_u,
            status=self.ta_port,
            _type=3,
        )
        self.sendSignal.emit(message)
        return message

    def run(self):
        # return
        messages = data.get_message(self.my_u, self.ta_u)
        # print(messages)
        for message in messages:
            self.isSend_signal.emit(message)
        # self.recv_msg()


class myTextEdit(QtWidgets.QTextEdit):  # 继承 原本组件
    sendSignal = pyqtSignal(str)

    def __init__(self, parent):
        QtWidgets.QTextEdit.__init__(self, parent)
        self.parent = parent
        _translate = QtCore.QCoreApplication.translate
        self.setHtml(_translate("Dialog",
                                "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
                                "<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
                                "p, li { white-space: pre-wrap; }\n"
                                "</style></head><body style=\" font-family:\'SimSun\'; font-size:15pt; font-weight:400; font-style:normal;\">\n"
                                "<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html>"))

    def keyPressEvent(self, event):
        QtWidgets.QTextEdit.keyPressEvent(self, event)
        if event.key() == Qt.Key_Return:  # 如果是Enter 按钮
            modifiers = event.modifiers()
            if modifiers == Qt.ControlModifier:
                print('success press ctrl+enter key', self.toPlainText())
                self.append('\0')
                return
            self.sendSignal.emit(self.toPlainText())
            print('success press enter key', self.toPlainText())

        # if modifiers == (Qt.ControlModifier) and event.key() == Qt.Key_Return:
        #     self.sendSignal.emit(self.toPlainText())
        #     print('success press enter key', self.toPlainText())
