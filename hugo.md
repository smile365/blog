---
title: 使用hugo创建自己的blog
date: 2018-07-04
tags:
 - hugo
 - bloger
 - centos
---

**centos安装**[hugo](https://gohugo.io/getting-started/quick-start/)

```sh
yum-config-manager --add-repo https://copr.fedorainfracloud.org/coprs/daftaupe/hugo/repo/epel-7/daftaupe-hugo-epel-7.repo
yum -y install hugo
hugo version
```

hugo列表无法正确显示的解决方法

在其他地方显示正常的md文件，在hugo下显示错误。其原因是hugo使用了Blackfriday作为Markdown解析引擎。

方法一：在列表前方增加一行空行
```md
list

- item1
- item2
```

方法二：配置Blackfriday对列表前无需空行`vim config.toml`
```toml
[blackfriday]
  extensions = ["noEmptyLineBeforeBlock"]
```

测试  
```sh
# test whith draft posts
$ hugo server -D -t wehuth --bind=0.0.0.0 --baseURL=http://127.0.0.1:1313
```


**参考**
- [gohugo.io](https://gohugo.io/getting-started/quick-start/)
- [hugo列表显示错误](https://orianna-zzo.github.io/sci-tech/2018-03/blog%E5%85%BB%E6%88%90%E8%AE%B07-hugo%E5%A4%9A%E7%BA%A7%E5%88%97%E8%A1%A8%E6%97%A0%E6%B3%95%E6%98%BE%E7%A4%BA--cocoa%E4%B8%BB%E9%A2%98%E7%9A%84markdown-bug%E5%90%88%E9%9B%86/)
- [使用Hugo搭建静态站点](https://tonybai.com/2015/09/23/intro-of-gohugo/)