---
title:  caddy
heading:  
date: 2022-12-26T11:08:27.453Z
tags: 
categories: ["code"]
Description:  
---
## install on centos7
参考 [candy 官方文档](https://caddyserver.com/docs/install#fedora-redhat-centos)使用 yum 安装
```bash
yum install yum-plugin-copr
yum copr enable @caddy/caddy
yum install caddy
caddy version
```


## 反向代理
需要监听 80 和 443 端口，如果开启了 nginx 需要关闭 80 和 443 端口。会自动申请 ssl 证书，并启动反向代理

（1）使用命令行
```bash
caddy reverse-proxy --from www.sxy21.cn --to 10.0.8.9:30180

```

（2）使用 Caddyfile 

新增一个配置文件 `vi /etc/caddy/Caddyfile`，内容如下：
```nginx
https://www.sxy21.cn

reverse_proxy 10.0.8.9:30180
```

多个站点
```
https://www.sxy21.cn {
	reverse_proxy 10.0.8.9:30180
}

https://sxy21.cn {
	reverse_proxy 10.0.8.9:30180
}

https://www.sxy21.cn {
	file_server
	root /usr/share/www/myblog/public
}

```


## 运行
```bash
# 验证文件是否正确, --adapter 表示文件格式 caddyfile | jonson
caddy validate --config /etc/caddy/pve_caddy --adapter caddyfile

# 前台启动 run
caddy run --config /etc/caddy/pve_caddy --adapter caddyfile

# 后台启动 start
caddy start --config /etc/caddy/pve_caddy --adapter caddyfile

# 查看证书申请的位置
find / -name "my.sxy21.cn"
# /root/.local/share/caddy/certificates/acme-v02.api.letsencrypt.org-directory/my.sxy21.cn

```

## 静态文件

```bash
caddy file-server --root ~/mysite
```

## 自动解析 markdown 文件



## 参考文献
- [caddy](https://caddyserver.com/)

