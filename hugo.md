---
title: 使用hugo创建自己的blog
date: 2018-07-04
tags:
 - hugo
 - bloger
 - centos
categories: ["code"]

---

### 安装

Centos 系统安装方法：
```sh
yum-config-manager --add-repo https://copr.fedorainfracloud.org/coprs/daftaupe/hugo/repo/epel-7/daftaupe-hugo-epel-7.repo
yum -y install hugo
hugo version
```

Mac 系统[安装](https://gohugo.io/getting-started/quick-start/)方法：
使用 
```sh
# 安装
brew install hugo
# 测试
hugo version
```

如果 安装不成功，可以直接[下载](https://github.com/gohugoio/hugo/releases)二进制文件[安装](https://discourse.gohugo.io/t/script-to-install-latest-hugo-release-on-macos-and-ubuntu/14774)
下载并解压后。
```
# 改成可运行
chmod +x hugo
# 放到用户目录
mv hugo /usr/local/bin/
# 测试
hugo version
```

之后的创建站点、使用主题、添加内容、启动等都可以从[quick-start](https://gohugo.io/getting-started/quick-start/)查看到。

debian 系统[安装方法](https://gohugo.io/installation/linux/#debian)
```bash
apt install -y hugo
```

## 创建 blog
1. 参考 [官方教程](https://gohugo.io/getting-started/quick-start/#create-a-site)初始化一个 blog
```bash
# 找一个文件夹
mkdir -p /usr/share/www
cd /usr/share/www && hugo new site myblog
cd myblog
git init
# 配置主题
git submodule add https://gitee.com/smile365/wehuth.git themes/wehuth

# 配置文件
cp themes/wehuth/exampleSite/config.toml .
```

2. 创建文章
```bash
# hugo new posts/my-first-post.md
# ~/content/posts/my-first-post.md created
git submodule add https://github.com/smile365/blog.git content/posts

# hugo server
hugo server -D -t wehuth --bind=0.0.0.0 --baseURL=http://127.0.0.1:1313
```



### Hugo 文章列表无法正确显示的解决方法

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

### 开启百度统计


按照要求把[百度统计代码](https://tongji.baidu.com/web/welcome/basic)复制到模版的single.html/list.html等地方。

先去注册[leancloud](https://leancloud.cn/?source=XRC4B1YQ)

创建应用，
把代码复制到需要的地方


[使用valine作为评论插件](https://valine.js.org/quickstart.html)

把代码复制到模版的single.html页面

推荐主题：

- [KeepIt](https://github.com/Fastbyte01/KeepIt),[demo](https://shuzang.github.io/)
- [Wehuth](https://gitee.com/smile365/wehuth)

**参考**  
- [gohugo.io](https://gohugo.io/getting-started/quick-start/)
- [hugo列表显示错误](https://orianna-zzo.github.io/sci-tech/2018-03/blog%E5%85%BB%E6%88%90%E8%AE%B07-hugo%E5%A4%9A%E7%BA%A7%E5%88%97%E8%A1%A8%E6%97%A0%E6%B3%95%E6%98%BE%E7%A4%BA--cocoa%E4%B8%BB%E9%A2%98%E7%9A%84markdown-bug%E5%90%88%E9%9B%86/)
- [使用Hugo搭建静态站点](https://tonybai.com/2015/09/23/intro-of-gohugo/)