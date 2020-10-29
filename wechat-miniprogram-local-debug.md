---
title:  wechat-miniprogram-local-debug
heading: 微信公众号开发本地调试
date: 2020-10-29T03:33:11.148Z
categories: ["code"]
tags: 
description: 
---

微信公众号后台配置可信 request 域名
![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1603942624559.png)

服务器启动一个 nginx，配置如下：
```
    location /api/wechat/login/ {
            proxy_pass http://127.0.0.1:14030;
    }
```

在笔记本电脑执行
```
ssh -R 14030:localhost:8080 root@songxueyan.top
```

用 Python 写一个调用微信服务器的服务 weapi.py
```
import requests
from bottle import run,request,get

WECHAT_LOGIN_API = "https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code"

@get("/api/v1/books/wechat")
def wechat_login():
	code = request.query.code
	print(code)
	url = WECHAT_LOGIN_API % (APPID,AppSecret,code)
	r = requests.get(url)
	print(r.text)
	return r.json()

run(port=8080)
```

笔记本电脑启动
```
python weapi.py
```

小程序端登录代码

```javascript
 onLoad: function () {
    wx.login({
      success(res) {
        if (res.code) {
          //发起网络请求
          wx.request({
            url: 'https://songxueyan.top/api/v1/books/wechat',
            data: {
              code: res.code
            },
            success(r) {
              console.log('登录成功' + r);
            }
          })
        } else {
          console.log('登录失败！' + res.errMsg)
        }
      }
    })
 }
```
