---
title:  python-正则匹配中文日文韩文
heading: python判断是不是韩语日语和中文
date: 2019-11-06T09:52:57.390Z
tags: ["正则","韩文匹配","日文匹配"]
categories: ["code"]
description: 用python正则表达式来判断是否可以匹配中日韩文，正则匹配日语，正则匹配韩语。
---

项目中需要用python判断某段文本是不是韩语日语，可以用python正则表达式来解决。

首先得知道UTF-8(Unicode)编码区间如下：
- u0800-u4e00 (日文)
- u4e00-u9fa5 (中文)
- uac00-ud7a3 (韩文)


所以python匹配中日韩文的正则如下：

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