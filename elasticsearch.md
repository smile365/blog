---
title:  elasticsearch简单入门教程
heading:
date: 2020-05-09T06:42:21.580Z
categories: ["code"]
tags: 
description: 
---


按照官方文档在centos安装完[elasticsearch7](https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html)之后.

两个常用python客户端： 
- [elasticsearch-py](https://elasticsearch-py.readthedocs.io/en/master/index.html)，Elasticsearch的官方最原始客户端，方便扩展。对于入库推荐使用此模块下的[批处理](https://elasticsearch-py.readthedocs.io/en/master/helpers.html)来批量入库。
- [elasticsearch-dsl](https://elasticsearch-dsl.readthedocs.io/en/latest/index.html)，Elasticsearch DSL是一个封装程度更高的库。`elasticsearch-py`用来dict来检索数据，写出来非常冗余不易修改且容易写错。`elasticsearch-dsl`定义了映射，检索和保存文档等类，将文档数据包装在用户定义的类中，写起来容易理解且代码量很少。比较合适用来检索分析聚合等方面。

