---
title: CentOS7安装hugo
date: 2018-07-04
tags: ["centos","hugo"]
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



定时发布脚本
```shell?linenums
#!/usr/bin/sh
#publish_blog.sh
rm -rf /home/myblog/content/posts/*
cd /home/script/blog
echo `pwd`
echo `git pull`
cp -rf * /home/myblog/content/posts
cd /home/myblog
echo `pwd`
echo `hugo -b https://sxy91.com/ -t cactus`
```

contab -l
0 */1 * * * /home/scritp/publish_blog.sh

修改主题的时间显示样式
themes/cactus/layouts/partials/post-list.html
.Date.Format "2006-01-02"

显示摘要
vi /home/myblog/config.toml
[params]
 enableSummary = true

使用描述作为摘要
[params]
 enableSummary = true
 useDescriptionReplaceSummary = true

文章中增加
description

github图片不显示的处理
使用图床，7牛云存储

seo修改
显示缩略图

评论
百度统计，谷歌统计


**参考**
[官方文档](https://gohugo.io/getting-started/quick-start/)
[Format](https://gohugo.io/functions/format/)
[configuration](https://gohugo.io/getting-started/configuration/)

