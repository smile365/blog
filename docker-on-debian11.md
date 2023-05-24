
---
title: docker-on-debian11 
heading: 
date: 2023-05-24
categories: ["code"]
tags: 
description: 
---



要在 Debian 上安装 Docker，请按照以下步骤：

1. 更新apt-get：

```
apt update
```

2. 安装依赖软件包：

```
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
```

3. 添加Docker GPG密钥：

```
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

4. 添加Docker存储库：

```
echo deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

5. 更新apt-get：

```
apt update
```

6. 安装Docker：

```
apt install -y docker-ce docker-ce-cli containerd.io
```

7. 验证安装是否成功：

```
docker run hello-world
```

如果成功安装， 将会输出“Hello from Docker!”

