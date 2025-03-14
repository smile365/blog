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
OPENAI_MODEL=deepseek-chat
OPENAI_API_KEY=sk-xxx
OPENAI_BASE_URL=https://api.deepseek.com/v1
```

## 在飞牛 os 中创建配置文件夹路径
文件管理 -》 新建文件夹 config/migpt

上传 
```javascript
    // 小米 ID
    userId: "1234567", // 注意：不是手机号或邮箱，请在「个人信息」-「小米 ID」查看
    // 账号密码
    password: "1234567",
    // 小爱音箱 DID 或在米家中设置的名称
    did: "小爱音箱pro", // 注意空格、大小写和错别字（音响 👉 音箱）
	streamResponse: true,
```



## 安装过程

```
ssh fnos
sudo -i
docker pull idootop/mi-gpt:latest

docker run -d --env-file /vol1/1000/config/migpt/.env -v /vol1/1000/config/migpt/.migpt.js:/app/.migpt.js --name migpt idootop/mi-gpt:latest
```

migpt Open AI ❌ LLM 响应异常 APIError: 402 Insufficient Balance