---
title: mi-gpt-deepseek
heading:  
date: 2025-03-13T14:27:38.935Z
tags: 
categories: ["code"]
Description:  
---
## 	前言


## 获取 .migpt.js 所需信息
1. 小米 id
米家 app  -》我的 -》 {你的昵称} -> {你的昵称} 
2. did
米家 app  -》  {你的音箱名称}
3. 密码

## 获取 .env 所需信息
登录 [deepseek api 文档](https://api-docs.deepseek.com/zh-cn/api/deepseek-api/) 创建 API 密钥。
```env
# OpenAI（也支持通义千问、MoonShot、DeepSeek 等模型）
OPENAI_MODEL=deepseek-reasoner
OPENAI_API_KEY=sk-xxx
```

## 在飞牛 os 中创建配置文件夹路径
文件管理 -》 新建文件夹 config/migpt




## 安装过程

```
ssh fnos
sudo -i
docker pull idootop/mi-gpt:latest

docker run -d --env-file /vol1/1000/config/migpt/.env -v /vol1/1000/config/migpt/.migpt.js:/app/.migpt.js idootop/mi-gpt:latest
```

