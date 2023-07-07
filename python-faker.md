---
title: python 使用 faker 自动生成假数据和测试数据
heading: 
date: 2021-01-20T02:37:09.448Z
categories: ["code"]
tags: 
description: python-faker
---
## 前言
[faker](https://faker.readthedocs.io/en/master/)可以生成非常真实的随机数据，通过它的[提供者](https://faker.readthedocs.io/en/master/providers.html)，可以生成诸如姓名、地址、ip、公司名、银行卡号、邮编、ISBN、时间、手机号、职业等等数据。通过本地话配置可支持设置不同的语言和地区。

另一个相似的工具是 [mimesis](https://github.com/lk-geimfari/mimesis)

## 安装

```bash
pip install faker
```

## 使用

### 简单使用
```python
from faker import Faker
# 设置语言
fake = Faker('zh_CN')

print(fake.name())
print(fake.random_int(0, 100))
print(fake.random_number(digits=10))

print(fake.lexify(text='测试字符串：????', letters='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'))
```

### 案例
```python

# pip3 install Faker requests
from faker import Faker
import json
import requests

# 创建 Faker 实例
fake = Faker()

# 生成用户信息
users = []
for i in range(300000):
    user = {
        "id": fake.uuid4(),
        "userPoolId":"64916f78cc768114483d9924",
        "status": "Activated",
        "email": fake.email(),
        "username": fake.user_name(),
        "nickname": fake.name(),
        "gender": fake.random_element(["M", "F", "U"])
    }
    #print(f'{i}:{user["id"]}')
    users.append(user)

# 将用户信息写入 JSON 文件
with open("users30w.json", "w") as f:
    json.dump(users, f, indent=4)

print("用户信息已写入 users30w.json 文件。")


# 发送 POST 请求
url = 'localhost:8080/users/save'
headers = {'Content-type': 'application/json'}
r = requests.post(url, json=users, headers=headers)
# 检查响应状态码
if r.status_code == 200:
    print(f'用户信息已成功发送到 {url}')
else:
    print("发送失败。")
print(r.text)
```





## 参考文档
- [假数据 3 种方法](https://blog.csdn.net/pythonxiaopeng/article/details/109026484)