---
title: mycat出错的问题集锦及解决方式
tags: 新建,模板,小书匠
grammar_cjkRuby: true
---


[ERROR][WrapperSimpleAppMain] 2018-06-26 14:41:44 startup error java.lang.NumberFormatException: Size must be specified as bytes (b), kibibytes (k), mebibytes (m)


主要是内存不足


Caused by: io.mycat.config.util.ConfigException: org.xml.sax.SAXParseException; lineNumber: 2; columnNumber: 6; 不允许有匹配 "[xX][mM][lL]" 的处理指令目标。