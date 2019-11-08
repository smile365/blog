---
title:  python-正则匹配中文日文韩文
date: 2019-11-06T09:52:57.390Z
tags: ["正则"]
categories: ["code"]
description: 
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

