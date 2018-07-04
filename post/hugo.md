---
title: CentOS7安装hugo
tags: centos,hugo
draft: true
---

**安装命令**
```shell?linenums
yum-config-manager --add-repo https://copr.fedorainfracloud.org/coprs/daftaupe/hugo/repo/epel-7/daftaupe-hugo-epel-7.repo
yum install hugo
hugo version
```

[下载和使用主题](https://gohugo.io/themes/installing-and-using-themes/)
选择一个适合自己的[主题](https://themes.gohugo.io/)

**使用主题**
* 命令行 hugo server -t themename
* 配置文件 theme: themename



**参考**
[官方文档](https://gohugo.io/getting-started/quick-start/)
