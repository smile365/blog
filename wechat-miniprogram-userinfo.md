---
title: 微信小程序免授权获取用户头像昵称用于展示
heading: 微信小程序无需授权获取用户昵称头像方法教程
date: 2020-10-29T02:57:31.912Z
categories: ["code"]
tags: 
description:  wechat-miniprogram-userinfo
---

需求：用户打开小程序时，无需授权即可显示用户的昵称和头像，且自动登录成功，不弹框获取到用户的openid。

### 一、微信小程序无需授权获取用户昵称头像

```
<!-- 如果只是展示用户头像昵称，可以使用 <open-data /> 组件 -->
<open-data type="userAvatarUrl"></open-data>
<open-data type="userNickName"></open-data>

```


### 二、微信小程序无需授权获取 openid

小程序可以通过微信官方提供的登录能力方便地获取微信提供的用户身份标识，快速建立小程序内的用户体系，[登录步骤](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/login.html)

步骤：
1. 小程序先调用 wx.login 获取 code
2. 然后把 code 传给自己在微信后台配置的后端服务器
3. 后端服务器拿 code 去微信服务器取 openid

小程序端的登录代码如下
```javascript
wx.login({
      success(res) {
        if (res.code) {
          //发起网络请求
          // url 需要用你自己服务器的地址
          wx.request({
            url: 'https://songxueyan.top/api/wechat/login',
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
```

服务器端代码请参考：

### 参考文献：

- [组件-开放能力-open-data](https://developers.weixin.qq.com/miniprogram/dev/api/open-api/user-info/wx.getUserInfo.html)
- [开发接口-登录-wx.login](https://developers.weixin.qq.com/miniprogram/dev/api/open-api/login/wx.login.html)