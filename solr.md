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

### 添加实例

进入Cloudera Manager主页，集群-->solr-->操作-->添加角色实例

 Gateway × 2 新建
 Solr Server × 1

### 使用python客户端[pysolr](https://github.com/django-haystack/pysolr/)
```bash
#使用SolrCloud模式需要安装kazoo
pip install kazoo
```

solr（7.4）调整了配置文件的路径及名称，Pysolr（3.8.1）还未支持到最新版本的规则，使用SolrCloud模式需要在初始化zookeeper前定义ZooKeeper中`ZooKeeper.CLUSTER_STATE`的节点路径。
否则会报错`pysolr.SolrError: Unknown collection: your_collection`：
```python
pysolr.ZooKeeper.CLUSTER_STATE = '/solr/collections/your_collection/state.json'
zookeeper = pysolr.ZooKeeper("server-01:2181,server-02:2181,server-03:2181")
solr = pysolr.SolrCloud(zookeeper,"your_collection")
print(len(solr.search("*:*")))

```



参考  

- [搭建SolrCloud集群服务](https://segmentfault.com/a/1190000010836061#articleHeader21)
- [pysolr使用SolrCloud模式问题](https://stackoverflow.com/questions/47263729/connection-to-solr-cloud-collection-using-pysolr)