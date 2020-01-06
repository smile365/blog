---
title:  werobot教程
heading: werobot微信公众号开发教程(2020年)
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
from werobot import WeRoBot
robot = WeRoBot(token='your token')
robot.config["APP_ID"] = "your APP_ID"
robot.config['ENCODING_AES_KEY'] = 'your ENCODING_AES_KEY'

@robot.handler
def echo(message):
    return 'Hello World!'

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


关注公众号测试。

