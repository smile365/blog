---
title: python 使用 faker 自动生成假数据和测试数据
heading: 
date: 2021-01-20T02:37:09.448Z
categories: ["code"]
tags: 
description: python-faker
---

安装[faker](https://faker.readthedocs.io/en/master/)

```bash
pip install faker
```

使用

```python
from faker import Faker
fake = Faker()

fake.name()
```



