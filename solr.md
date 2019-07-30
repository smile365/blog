---
title:  solr
date: 2019-07-30T07:37:40.166Z
tags: 
categories:
draft: true
description: 
---


打开solr主页
点击`collections`,点击`add`

选择刚刚创建好的collection，依次点击`schema -> Add Field`

如果不创建Field，会使用默认的schema。字符串字段一般会以[]形式保存。


安装ik分词
打开 [localhost:8983/solr](http://localhost:8983/solr/#/)
点击`java-properties`,查看`jetty.home`项

```bash
export solr=/opt/cloudera/parcels/CDH-6.2.0-1.cdh6.2.0.p0.967373/lib/solr
cd $solr
cd $solr/server/solr/configsets/_default
mv ik-analyzer-7.7.1.jar solr-webapp/webapp/WEB-INF/lib/
```

修改solr core的schema文件

SolrCloud是通过zk来管理配置文件的，需要先下载下来修改，然后再上传到zk。
```bash
./bin/solr zk ls /configs/_default -z localhost:2128,.,.,.
./bin/solr zk downconfig 
./bin/solr zk downconfig -d _default -n _default -z localhost:2181
./bin/solr zk downconfig -d $solr/server/solr/configsets/_default -n _default -z localhost:2128,.,.,.
./bin/solr zk upconfig -d $solr/server/solr/configsets/_default -n _default -z localhost:2128,.,.,.

```

```xml
 <!-- ik分词器 -->
 <fieldType name="text_ik" class="solr.TextField">
   <analyzer type="index">
       <tokenizer class="org.wltea.analyzer.lucene.IKTokenizerFactory" useSmart="false" conf="ik.conf"/>
       <filter class="solr.LowerCaseFilterFactory"/>
   </analyzer>
   <analyzer type="query">
       <tokenizer class="org.wltea.analyzer.lucene.IKTokenizerFactory" useSmart="true" conf="ik.conf"/>
       <filter class="solr.LowerCaseFilterFactory"/>
   </analyzer>
 </fieldType>
```

参考  

- [搭建SolrCloud集群服务](https://segmentfault.com/a/1190000010836061#articleHeader21)