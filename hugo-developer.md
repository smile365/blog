---
title:  hugo主题开发实战
date: 2019-11-04T01:51:55.940Z
tags: 
categories: ["code"]
draft: true
description: 
---

课程目录

- day1-hugo介绍及安装使用
- day2-开发主页
- day3-开发详情页
- day3-美化主页
- day4-美化详情页
- day5-增加评论和百度统计
- day6-开发栏目
- day7-自动化部署
- day8-部署到github pages
- day9-部署到自有服务器
- day10-申请一个免费顶级域名
- day11-配置域名解析和https证书
- day12-永久固定url
- day13-配置cdn提升访问速度
- day14-seo优化。


md文件建议的字段

```markdown
---
title:  hugo主题开发实战
date: 2019-11-04T01:51:55.940Z
tags: 
  - blog
  - hugo
categories:
  - code
draft: true
description: hugo theme developer 开发

---
```

对应在html的head部分

```html
  <meta name="Keywords" content="宋洋葱,本草洋葱,宋佳小巷,宋学彦,博客,bloger"/>
  <meta name="Description" content=" {{ .Site.Title }}"/>
  <meta name="author" content="{{ .Site.Params.author }}" />
  <meta name="title" content="{{ if .IsHome }}{{ .Site.Title }}{{ else if .Params.heading }}{{ .Params.heading }}{{ else }}{{ .Title }} | {{ .Site.Title }}{{ end}}">
```

|   html  |  md   |  说明   |
| --- | --- | --- |
|  Keywords   | tags    |     |
|  Description   | description    |     |
|  title   |   title  |     |
|  author   |   author  |     |



参考  

- []()
