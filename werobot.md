---
title:  werobot教程
heading: werobot微信公众号开发教程--2020年
date: 2020-01-06T06:29:34.327Z
categories: ["code"]
tags: ["微信公众号","werobot","教程"]
description: 
---


**安装[werobot](https://werobot.readthedocs.io/zh_CN/latest/index.html)**

```bash
pip install werobot cryptography bottle
```


如果创建自定义菜单失败，请登录微信公众号后台，点击开发-借口权限查看是否具有创建自定义菜单的权限。

**配置AppID和AppSecret**

- 登录公众号-->开发-->基本配置-->启用
- 配置好AppID、AppSecret、IP白名单并记录下AppSecret

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1578292719110.png)

**nginx反向代理配置**
```nginxconf
    location /wechat/ {
            proxy_pass_header Server;
            proxy_redirect off;
            proxy_pass http://127.0.0.1:8091/wechat/;
    }
```


**代码**

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Date    : 2020-01-06 13:18:25
# @Author  : songxueyan (sxy9103@gmail.com)
# @Link    : https://sxy91.com

from werobot import WeRoBot
import re
#from entity import save,update,query
#from util import send_email

robot = WeRoBot(token='sxy91')
robot.config["APP_ID"] = "YOUR APP_ID"
robot.config["APP_SECRET"] = "YOUR APP_SECRET"
robot.config['ENCODING_AES_KEY'] = 'YOUR ENCODING_AES_KEY'

client = robot.client

email_reg = re.compile(".*([a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+)")

@robot.filter("1")
def find_one():
	'''需要微信公众号开发电子书请回复“1”
	'''
    return "请提供你的邮箱" # 当用户发送“1”时，让用户提供邮箱

@robot.filter(email_reg)
def find_email(message, session, match):
	'''使用过滤器过滤出邮箱
	'''
	if match:
		email = match.group(1)
		u = update(message.source,email=email)
		if not u:
			uinfo = client.get_user_info(uid)
			uinfo['email'] = email
			#save(uinfo)
		#send_email(email) # 把电子书通过附件发送给用户
		return "已发"
	return "未知"

# 关注回复
hello_msg = "{nickname}，欢迎你来到「下课了」。我是宋洋葱，将会在这里和你聊聊投资理财、写作和职场等话题。针对互联网工作的小伙伴将不定期发送内推渠道。\n1.需要电子书请回复1"

@robot.subscribe
def subscribe(message):
	'''用户关注后的回复
	'''
	user = client.get_user_info(message.source) # message.source相当于用户的user_id
	#save(user) # 把用户信息保存到数据库
	return hello_msg.format(nickname=user['nickname'])  # 回复欢迎语

@robot.unsubscribe
def unsubscribe(message):
	pass

from bottle import Bottle
from werobot.contrib.bottle import make_view

app = Bottle()
app.route(
    '/wechat/',  # WeRoBot 挂载地址
    ['GET', 'POST'],
    make_view(robot)
)

app.run(port=8091)
```

**服务器配置**

- 开发-->基本配置-->修改配置
- 填写好代码里的：URL、Token、EncodingAESKey后点击启用


![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1578292762126.png)


欢迎关注公众号「**下课了**」测试。

