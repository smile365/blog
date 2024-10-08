---
title: ai-prompt-es-ilm
heading:  
date: 2023-10-30T02:53:12.544Z
categories: ["code"]
tags: 
description:  ai chatgpt prompt es ilm 。使用 AI 验证 es 的 ILM 功能。 Open-AI chatgpt-4 、 讯飞-星火 、百度-文心一言 、 阿里-通义千问 使用体验和评测对比。
---

## 前言


ILM 有什么要求
版本？
节点数量？
硬件要求？
其他未知


## prompt
1. 在 es 中启用 index lifecycle management (ILM) 功能需要什么条件？

| chatgpt-4                                               | 讯飞-星火                                               | 百度-文心一言                                           | 阿里-通义千问                                           |
| ------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------- |
| ![](https://cdn.sxy21.cn/static/imgs/1698637512861.png) | ![](https://cdn.sxy21.cn/static/imgs/1698637550186.png) | ![](https://cdn.sxy21.cn/static/imgs/1698637567443.png) | ![](https://cdn.sxy21.cn/static/imgs/1698637623782.png) |

总结：chatgpt、星火、通义千问提供了版本要求，文心一言没有提供有信息。但通义千问的版本是错的。 

有效信息：Elasticsearch 版本至少为6.7或更高即可。

2. 启用 ILM 功能是否有版本、节点数量、内存要求？有的话请列出具体明细。

| chatgpt-4 | 讯飞-星火 | 百度-文心一言 | 阿里-通义千问 |
| --------- | --------- | ------------- | ------------- |
| ![chatgpt-4](https://cdn.sxy21.cn/static/imgs/1698638070343.png) | ![讯飞-星火](https://cdn.sxy21.cn/static/imgs/1698638088236.png) | ![百度-文心一言](https://cdn.sxy21.cn/static/imgs/1698638106114.png) | ![阿里-通义千问](https://cdn.sxy21.cn/static/imgs/1698638119862.png)|

总结：同上，除了第一次提问的，基本没要求。

3. 单节点的 Elasticsearch 是否可以启用 index lifecycle management (ILM) 功能？

| chatgpt-4 | 讯飞-星火 | 百度-文心一言 | 阿里-通义千问 |
| --------- | --------- | ------------- | ------------- |
| ![chatgpt-4](https://cdn.sxy21.cn/static/imgs/1698638224393.png) | ![讯飞-星火](https://cdn.sxy21.cn/static/imgs/1698638212414.png) | ![百度-文心一言](https://cdn.sxy21.cn/static/imgs/1698638201871.png) | ![阿里-通义千问](https://cdn.sxy21.cn/static/imgs/1698638191259.png) |

总结：全部 AI 都表示单节点可以使用 ILM 功能，但 chatgpt 提供了单节点下的限制条件。

4. 如果在单节点的 Elasticsearch 启用 index lifecycle management (ILM) 功能，有哪些限制？

| chatgpt-4 | 讯飞-星火 | 百度-文心一言 | 阿里-通义千问 |
| --------- | --------- | ------------- | ------------- |
| ![chatgpt-4](https://cdn.sxy21.cn/static/imgs/1698638394987.png) | ![讯飞-星火](https://cdn.sxy21.cn/static/imgs/1698638371151.png) | ![百度-文心一言](https://cdn.sxy21.cn/static/imgs/1698638354368.png) | ![阿里-通义千问](https://cdn.sxy21.cn/static/imgs/1698638343754.png) |

总结：chatgpt 最准确；星火说到了一部分，但不全面；文心一言和通义千问可以说没提供有心信息。

5. 如何使用 docker 部署一个节点的 Elasticsearch 8.10。

| chatgpt-4 | 讯飞-星火 | 百度-文心一言 | 阿里-通义千问 |
| --------- | --------- | ------------- | ------------- |
| ![chatgpt-4](https://cdn.sxy21.cn/static/imgs/1698638672782.png) | ![讯飞-星火](https://cdn.sxy21.cn/static/imgs/1698638702881.png) | ![百度-文心一言](https://cdn.sxy21.cn/static/imgs/1698638779749.png) | ![阿里-通义千问](https://cdn.sxy21.cn/static/imgs/1698638801594.png) |

6. 如何在一个节点的 Elasticsearch 8.10 中创建 ILM 策略实现以下需求： 
	- 当文档数大于 20 触发滚动策略。
	- 当文档年龄超过 20 分钟触发删除。

| chatgpt-4 | 讯飞-星火 | 百度-文心一言 | 阿里-通义千问 |
| --------- | --------- | ------------- | ------------- |
| ![chatgpt-4](https://cdn.sxy21.cn/static/imgs/1698639344221.png) | ![讯飞-星火](https://cdn.sxy21.cn/static/imgs/1698639285940.png) | ![百度-文心一言](https://cdn.sxy21.cn/static/imgs/1698639394754.png) | ![阿里-通义千问](https://cdn.sxy21.cn/static/imgs/1698639428606.png) |
7. 如何验证上面创建的 ILM 策略？

如何插入测试数据到索引 my_index-000001，用来验证上面创建的策略 “当文档数大于 20 触发滚动策略” 是否可成功执行？


如何插入测试数据到索引 my_index-000001，用来验证上面创建的策略 “当文档年龄超过 20 分钟触发删除” 是否可成功执行？

8. 对已经有 800 条数据的 mylog 索引使用 my_policy 策略会发生什么情况？



8. 总结
按照以上 4 款 AI 工具的流程，都无法成功验证单节点 es 的 ILM 功能。ILM 功能是一个复杂的特性，需要了解 es 中的副本数、分片、健康检测、滚动策略、索引的配置以及索引生命周期管理中的阶段、操作等特性。




百度-文心一言
讯飞-星火
阿里-通义千问
chatgpt

创造性 or 确定性
复杂 or 简单
步骤多 or 步骤简单


针对有创造性、复杂、步骤多的任务，需要你充当导师的角色，需要有能力自己实现，且知道和检查正确性，让 AI 做一些快速、且简单的工作，主要提升的是效率。比如写一个 yaml 部署文件，一个启动 es 的命令，各种配置，这些工作由人来做比较慢，但由 ai 来做就很快。

## 关于 ILM 的几点限制
测试 ILM 需要知道的知识点：
1. 当索引的健康状态为 green 时 ILM 才工作，其他状态功能受限。
	- green: 所有主要和副本碎片均已分配。您的集群可以100％运行。
	- yellow: 所有主分片均已分配，但至少缺少一个副本。没有数据丢失，因此搜索结果仍将是完整的。但是，您的高可用性在一定程度上受到了损害。如果更多碎片消失，则可能会丢失数据。可以将其yellow视为应该立即进行调查的警告。
	- red: 至少缺少一个主分片（及其所有副本）。这意味着您缺少数据：搜索将返回部分结果，而对该分片建立索引将返回异常
2. 引生命周期的 5 个阶段 Hot、Warm、Cold、Frozen、Delete，除 Delete 外其他阶段每开启一个阶段需要占用一个节点，Hot 为必选节点。
3. es 中节点数、副本数、分片数需满足：副本最大值+1 <= 集群节点数量 <= 分片数量。


总结一下就是：如果开启 ILM ，阶段数、集群节点数、分片数、副本数要根据实际情况匹配，否则功能受限。

假设 es 是单节点，如果想使用 ILM 功能，那么只能选择 Hot 或者 Hot + Delete 阶段，且副本数为 0，否则 ILM 功能受限。


## 验证步骤


1. 安装 es
 使用 docker 运行 es
```bash
docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:8.10.4

# 关闭 ssl 和账号密码  -e "xpack.security.enabled=false" 
# 仅关闭 ssl -e "xpack.security.http.ssl.enabled=false" 
```

从 Elasticsearch 8.0 开始，默认情况下会启用安全性。 首次启动 Elasticsearch 时，会自动配置 TLS 加密， 为用户生成密码， 并创建一个 Kibana 注册令牌，以便您可以将 Kibana 连接到受保护的集群。

配置账号密码
```bash
docker exec -it elasticsearch bin/elasticsearch-reset-password -u elastic
```




2. 创建索引策略  
PUT _ilm/policy/my_policy
```json
{
   "policy": {
     "phases": {
       "hot": {
         "actions": {
           "rollover": {
             "max_docs": 10,
			 "max_age": "10m"
           }
         }
       },
       "delete": {
         "min_age": "15m",
         "actions": {
           "delete" : {}
         }
       }
     }
   }
 }
```

3. 创建索引模板并指定索引策略和索引  
PUT _index_template/my_template
```json
{
  "index_patterns": ["my_index-*"],
  "priority": 100,
  "template":{
     "settings": {
      "number_of_shards": 1,
      "number_of_replicas": 0,
      "index.lifecycle.name": "my_policy",
      "index.lifecycle.rollover_alias": "my_alias"
    }
  }
}
```

注：若为集群模式，可不创建索引模板。步骤为先创建 ILM 策略，然后创建索引时增加如下配置  
PUT /my_index-000001
```json
{
  "settings": {
    "index.lifecycle.name": "my_policy",
    "index.lifecycle.rollover_alias": "my_alias"
  },
  "aliases": {
    "my_alias": {}
  }
}
```

4. [创建索引](https://www.elastic.co/guide/en/elasticsearch/reference/7.17/indices-create-index.html#indices-create-api-request-body)并指定别名  
> 注： 创建索引之前必须创建策略和模版，否则 ILM 策略不会生效。

   PUT /my_index-000001
```json
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 0
  },
  "aliases": {
    "my_alias": {}
  }
}
```

5. 查看是否使用了策略  
GET /my_alias/_ilm/explain
```json
{
	"indices": {
		"my_index-000002": {
			"managed": true,
			"policy": "my_policy"
		}
	}
}
```

若没使用，可查看配置是否正确
GET /my_alias/_settings
```
{
	"my_index-000001": {
		"aliases": {
			"my_alias": {}
		},
		"settings": {
			"index": {
				"lifecycle": {
					"name": "my_policy",
					"rollover_alias": "my_alias"
				},
				"number_of_shards": "1",
				"number_of_replicas": "0"
			}
		}
	}
}
```



5. 插入 20 条数据  
POST /my_alias/_doc  
```json
{
  "content":"ilm alias insert content"
}
```


6. 查看 segments 是否有新的 segment 创建  
GET /my_alias/_segments
```json
{
 "segments": {
	"_0": {
		"generation": 0,
		"num_docs": 1,
		"deleted_docs": 0,
		"size_in_bytes": 5174,
		"committed": true,
		"search": false,
		"version": "9.7.0",
		"compound": true,
		"attributes": {
			"Lucene90StoredFieldsFormat.mode": "BEST_SPEED"
		}
	},
	"_1": {
		"generation": 1,
		"num_docs": 19,
		"deleted_docs": 0,
		"size_in_bytes": 6014,
		"committed": true,
		"search": false,
		"version": "9.7.0",
		"compound": true,
		"attributes": {
			"Lucene90StoredFieldsFormat.mode": "BEST_SPEED"
		}
	}
 }
}				
```

7. 查看 index 健康状态，20 分钟后 health 为 green 表示正常。    
GET /my_alias/_stats/docs?pretty 
```json
{
	"indices": {
		"my_index-000001": {
			"health": "green",
			"status": "open",
			"total": {
				"docs": {
					"count": 11,
					"deleted": 0
				}
			}
		}
	}
}
```

8. 如果不是 green 可通过接口 `GET /my_alias/_settings ` 查看 number_of_shards 和 number_of_replicas  配置是否正确。   


## 针对已有索引设置 ILM 策略
已有索引无法通过索引模板来配置，直接指定策略名称。
1. 插入数据，模拟已有索引
POST /my_index-000001/_doc
```json
{
  "field1": "value1",
  "field2": "value2"
}
```

2. 查看配置  
GET /my_index-000001/_settings
```json
{
	"my1_index-000001": {
		"settings": {
			"index": {
				"number_of_shards": "1",
				"provided_name": "my1_index-000001",
				"number_of_replicas": "1"
			}
		}
	}
}
```

3. 创建 ILM 策略
```json
{
   "policy": {
     "phases": {
       "hot": {
         "actions": {
           "rollover": {
             "max_docs": 10,
			 "max_age": "10m"
           }
         }
       },
       "delete": {
         "min_age": "15m",
         "actions": {
           "delete" : {}
         }
       }
     }
   }
 }
```



4. 修改索引设置
PUT /my_index-000001/_settings

```json
{
    "index.number_of_replicas" : 0,
    "index.lifecycle.name": "my_policy"
}
```


## ILM 策略是否可以只使用 delete 阶段

1. 创建或更新策略
PUT /_ilm/policy/my_policy
```json
{
   "policy": {
     "phases": {
       "delete": {
         "min_age": "15m",
         "actions": {
           "delete" : {}
         }
       }
     }
   }
 }
```


2. 应用策略
PUT /my_index/_settings
```json
{
  "index.lifecycle.name": "my_policy"
}
```

 **注意：** 
1. 当策略生效时，满足删除条件后 es 会把整个 index 删除，此时 index 不存在如果其他服务对当前 index 查询会报错 “index_not_found_exception”
2. 若没开启 auto_create_index，此时对 index 新增数据会报错
3. 再次创建新的同名 index 不会自动使用当前策略。





**遇到的问题和解决方法**

发现第一次 rollover 成功了，然后 es 会自动创建一个新的索引 my_index-000002 。第 2 次发生 rollover 的时候，发现失败了，查看  health 为 yellow。原因是第 2 次创建新索引时  number_of_replicas 被设置成了默认值 1 ，设置成 0 才会保证 green。解决这个问题的办法就是提供一个创建索引的模板给 rollover 使用。 

## 疑问
1. 名称是否加后缀 00001
`index_patterns` 参数用来匹配索引，比如 `my_index-*`中的  * 号代表数字。

2. 对已有的 index 如何使用 ILM。
参考官网 [ILM for existing indices](https://www.elastic.co/guide/en/elasticsearch/reference/current/ilm-with-existing-indices.html#ilm-existing-indices-reindex)

3. 分片数必须为 1？ 分片数、节点数、副本数有什么关系？
集群所有索引的副本最大值+1 <= 集群节点数量 <= 分片数量。

4. 策略中只有 delete 是否可以？
可以

5.  达到 ILM 策略的条件了，为什么没触发 actions(rollover/delete)
默认 10 分钟检查一次。 可通过接口更改 PUT _cluster/settings
```json
{
  "persistent": {
    "indices.lifecycle.poll_interval": "1m" 
  }
}
```

6. 如果有两个节点是否需要模版

7. 同一个 index 是否可以使用多个 ILM
通过改 ILM 来实现。

8. 多个 index 是否可以使用同一个 ILM
参考 [apply-policy-multiple](https://www.elastic.co/guide/en/elasticsearch/reference/current/set-up-lifecycle-policy.html#apply-policy-multiple) 通过接口 PUT mylogs-pre-ilm*/_settings 

8. 策略中 max_age 和 min_age 是什么关系？

9. 同事对多个索引设置策略，如果有一个索引不存在，其他索引是否会设置成功？
不会。

10. max_age 和 min_age 的时间是按照文档插入时间还是索引创建时间？

11. 如果按照索引创建时间，在文档还持续插入的情况下是否会删除所有？

会删除所有数据。删除时不会按照文档插入时间删除，会直接删除整个 index。

12. 如果开启 rollover 则创建索引时必须配置别名，同时给索引更新使用策略时必须指定别名。


## 参考文档
- [Elasticsearch集群健康状态显示为yellow排查](https://www.cnblogs.com/charles101/p/14488609.html)
- [Elasticsearch索引生命周期管理](https://juejin.cn/post/7170097149491806222#heading-3)
