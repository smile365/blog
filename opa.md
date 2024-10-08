---
title: "opa 策略引擎教程"
heading:  
date: 2023-03-23T02:40:43.024Z
categories: ["code"]
tags: 
description:  
---
## 前言

[Open Policy Agent (OPA)](https://github.com/open-policy-agent/opa)是一个使用 golang 语言实现的开源通用策略引擎。OPA  主要由以下 3 个核心部分：
1. [Rego](https://www.openpolicyagent.org/docs/latest/policy-language/)：OPA 语言的名称，用来编写策略规则。
2. Input：需要执行策略计算的原始数据
3. Output：Rego 的计算结果

> Rego 的灵感来自 Datalog。而 Datalog 是一种声明式**逻辑**编程语言，它在语法上是 Prolog 的子集。


## 在线体验
官方提供了一个 [Playgroud](https://play.openpolicyagent.org/)，支持在线执行，整个界面窗口分为如下四块：
- 左侧一整块是 **Policy 窗口**：在此处使用 Rego 进行编写策略。
- 右上方是 **Input 窗口**：规则需要的外部数据在此处定义，比如 JSON 或 YAML 格式的数据。
- 右中间是 **Data 窗口**：若规则计算除了需要外部数据，还需要内部数据做比对，则可以在此定义。
- 右下方是 **Output 窗口**：OPA 进行策略决策后的结果输出区域，在 playground 这种方式中会将全部信息都输出给我们，没有办法指定查询指定的字段值，官方提示的示例中输出为布尔值。

可以点击 Examples 切换不同的例子，然后点击 Evaluate 执行查看结果。

可以使用 Rego 语法编写自己的策略，如：
```python
package cn.sxy21.demo1

import future.keywords.if
import future.keywords.in
import future.keywords.contains

default good := false

good if {
	# 如果 user 存在 pet 字段
    input.user.pet
    # 如果 user 的 pet 中含有 cat
    "cat" in input.user.pet
    # 如果 user 的 gender 是 M
    input.user.gender == "M"
    # 下方的等价为：是否存在 address 且 adress 不是 beijing
    # input.user.address != "beijing"
}

# have contains money ：当里面的条件满足时 在 have 这个集合里放入 money 的值
have contains money { 
	input.user.height >= 175
    money:= "Dollar"
}

have contains money { 
	input.user.age < 20
    money:= "RMB"
}
```

然后使用 input
```json
{
    "user": {
        "name": "song yang cong",
        "site": [
            "sxy21.cn",
            "sxy91.com"
        ],
        "age": 18,
        "height": 180,
        "email": "sxy996@qq.com",
        "gender": "M",
		"pet": [
            "cat",
            "dog",
			"elephant",
            "peacock"
        ]
    }
}

```

执行结果：
```json
{
    "good": true,
    "have": [
        "Dollar",
        "RMB"
    ]
}
```

### 或（or）操作
上面的例子都是 and 操作，如何表示[ or 操作](https://www.openpolicyagent.org/docs/latest/#logical-or) 呢？

规则：当服务器的协议包含 telnet 或者 ssh 时，输出服务器的 id 集合。
```prolog
package example.logical_or

shell_accessible[server.id] {
    server := input.servers[_]
    server.protocols[_] == "telnet"
}

shell_accessible[server.id] {
    server := input.servers[_]
    server.protocols[_] == "ssh"
}
```

输入：
```json
{
    "servers": [
        {
            "id": "busybox",
            "protocols": ["http", "telnet"]
        },
        {
            "id": "db",
            "protocols": ["mysql", "ssh"]
        },
        {
            "id": "web",
            "protocols": ["https"]
        }
    ]
}
```


输出：
```json
[
  "busybox",
  "db"
]
```


[内置函数](https://www.openpolicyagent.org/docs/latest/policy-reference/#built-in-functions)




## 安装 OPA
使用官方镜像仓库 [openpolicyagent/opa](https://hub.docker.com/r/openpolicyagent/opa/)

```bash
# pull
docker pull openpolicyagent/opa
# run on console
docker run -it --rm openpolicyagent/opa

# test
> pi := 3.14
> pi
# 3.14
> pi > 3
# true
exit

# 后台运行
docker run -itd -p 8181:8181 openpolicyagent/opa run --server --addr :8181
```

## 基于 rest api 使用

OPA REST API:
- [policy-api](https://www.openpolicyagent.org/docs/latest/rest-api/#policy-api)
- [data-api](https://www.openpolicyagent.org/docs/latest/rest-api/#data-api)

1. 先创建策略 `PUT /v1/policies/<id>`
```bash
curl --request PUT \
  --url http://localhost:8181/v1/policies/p001 \
  --header 'content-type: text/plain' \
  --data 'package cn.sxy21.demo1
import future.keywords.in
default resutl := false
resutl {
	"cat" in input.user.pet
	input.user.gender == "M"
}'
```
> `package` 具有唯一性，多个  policy 不允许出现相同的包名。

 2.  使用 input 数据验证策略

路径为：`/v1/data/{包名（把“.”替换成"/")}/{default 描述的部分}`
> 使用步骤 1 中的 `package`  来定位使用哪个 policy
```bash
curl --request POST \
  --url http://localhost:8181/v1/data/cn/sxy21/demo1/resutl \
  --header 'content-type: application/json' \
  --data '{
    "input":{
		"user": {
			"name": "song yang cong",
			"site": [
				"sxy21.cn",
				"sxy91.com"
			],
			"age": 18,
			"height": 180,
			"email": "sxy996@qq.com",
			"gender": "F",
			"pet": [
				"cat",
				"dog",
				"elephant",
				"peacock"
			]
			}
	}
}'
```

结果:
```json
{
	"result": false
}
```




## 集成到 spring boot 项目






## 参考文档
- [Open Policy Agent (OPA) 入门实践](https://moelove.info/2021/12/06/Open-Policy-Agent-OPA-%E5%85%A5%E9%97%A8%E5%AE%9E%E8%B7%B5/)
- [or-in-open-policy-agent](https://stackoverflow.com/questions/58314226/or-in-open-policy-agent-union-behavior)

