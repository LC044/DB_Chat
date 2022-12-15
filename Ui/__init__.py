# -*- coding: utf-8 -*-
"""
@File    : __init__.py.py
@Author  : Shuaikang Zhou
@Time    : 2022/12/13 14:19
@IDE     : Pycharm
@Version : Python3.10
@comment : ···
"""
#文件__init__.py
# from login import login
# from chat import chat

from .login import login
from .chat import chat
from .login import register
__all__ = ["login", "chat",'register']