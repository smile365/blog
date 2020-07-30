---
title:  cookies
heading: 用js/pyppeteer/splash/request_html设置cookies的方法
date: 2020-07-30T01:46:47.778Z
categories: ["code"]
tags: 
description: 
---

部分网站需要cookies才能显示特定信息，比如不登录的情况下看不到`https://github.com/smile365`的邮箱信息。

#### 用JavaScript设置和获取网站的cookies

用chrome打开网站，按f12点击console，然后输入代码
```javascript
// 获取cookies
document.cookie
```

同理可以用JavaScript设置cookies
```javascript
// 设置cookeis
Cookies ="_octo=GH1.1.1911316843.1574215196; _ga=GA1.2.86110170.1574215236; _device_id=26f4400b5e70fff5b84f47da276ffe20; tz=Asia%2FShanghai; _gat=1; has_recent_activity=1; user_session=zORKjgUUZSzRcxjNm8BMHvEmQcMLLiG3dbPET-3NpGTRSB0R; __Host-user_session_same_site=zORKjgUUZSzRcxjNm8BMHvEmQcMLLiG3dbPET-3NpGTRSB0R; logged_in=yes; dotcom_user=sxy91;"
c = Cookies.split(";")
for(var i in c){
	document.cookie = c[i].trim(); // 需要“name=value”的字符串形式
}
```
