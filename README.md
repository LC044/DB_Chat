组员 周帅康 2020303457

# 程序设计说明

## 一、文件结构

```bash
E:
│  main.py  // 主函数
│  
├─data
│  │  icon.png  // 程序图标
│  │  __init__.py
│  │  
│  └─avatar
│      ├─08
│      │  └─02
│      │     080261e4427a081fc6e637b654f590ee.png   // 头像    
│      └─f5
│         └─20
│            f5200f6894367c949cadd8f74c4ebe8c.png  // 头像
│                  
├─DB
│   data.py  // 数据库有关的函数都在这里
│    __init__.py
│      
└─Ui
   │  __init__.py
   │  
   ├─chat
   │  │  chat.py  // 聊天页面管理
   │  │  chatUi.py  // 聊天页面Ui的py版本
   │  │  chatUi.ui  // 聊天页面Ui的源程序
   │  │  __init__.py
   │  │  
   │  ├─addContact  // 添加联系人
   │  │      addContact.py
   │  │      addContactUi.py
   │  │      addContactUi.ui
   │  │      __init__.py
   │  │           
   │  ├─group  // 群聊
   │  │      addGroup.py
   │  │      addGroup.ui
   │  │      CreateGroup.py
   │  │      create_groupUi.py
   │  │      create_groupUi.ui
   │  │      Group.py
   │  │      GroupUi.py
   │  │      GroupUi.ui
   │  │      __init__.py
   │  │      
   │  ├─myinfo  // 个人信息查看与修改
   │  │      myinfo.py
   │  │      myinfoUi.py
   │  │      myinfoUi.ui
   │  │      __init__.py
   │  │      
   │  └─userinfo  // 联系人界面
   │     	  userinfoUi.py
   │          userinfoUi.ui
   │          __init__.py
   │          
   └─login  // 注册登录
        login.py
        loginUi.py
        loginUi.ui
        register.py
        registerUi.py
        registerUi.ui
        __init__.py
```

