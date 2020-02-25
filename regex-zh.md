---
title:  python-正则匹配中文日文韩文
date: 2019-11-06T09:52:57.390Z
tags: ["正则","韩文匹配"]
categories: ["code"]
description: 正则表达式匹配中日韩文
---

UTF-8(Unicode)编码区间如下：
- u0800-u4e00 (日文)
- u4e00-u9fa5 (中文)
- uac00-ud7a3 (韩文)


python正则如下：

```python
import re
p = re.compile('[\u0800-\u9fa5\uac00-\ud7a3]')
text = '''
这是简体中文,這是繁體中文
这是日文,これは日本語です
这是韩文,한국 사람입니다
'''
print(p.findall(text))
```

参考文档：

- [最新正则匹配手机号](https://sxy91.com/posts/regex-for-phone-number/)